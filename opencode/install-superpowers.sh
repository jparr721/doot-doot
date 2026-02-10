#!/usr/bin/env bash
set -euo pipefail

# ─── Config ───────────────────────────────────────────────────────────────────

SUPERPOWERS_DIR="$HOME/.config/opencode/superpowers"
PLUGINS_DIR="$HOME/.config/opencode/plugins"
SKILLS_DIR="$HOME/.config/opencode/skills"
PLUGIN_LINK="$PLUGINS_DIR/superpowers.js"
SKILLS_LINK="$SKILLS_DIR/superpowers"
REPO_URL="https://github.com/obra/superpowers.git"

# ─── Colors & Symbols ────────────────────────────────────────────────────────

bold="\033[1m"
dim="\033[2m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
cyan="\033[36m"
reset="\033[0m"

check="${green}✓${reset}"
cross="${red}✗${reset}"
arrow="${cyan}→${reset}"
warn="${yellow}!${reset}"

# ─── Helpers ──────────────────────────────────────────────────────────────────

header() {
    echo ""
    echo -e "${bold}${blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
    echo -e "${bold}${blue}  $1${reset}"
    echo -e "${bold}${blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"
    echo ""
}

step() {
    echo -e "  ${arrow} $1"
}

ok() {
    echo -e "  ${check} $1"
}

fail() {
    echo -e "  ${cross} $1"
}

warning() {
    echo -e "  ${warn} $1"
}

confirm() {
    local prompt="$1"
    local reply
    echo ""
    echo -ne "  ${bold}${prompt}${reset} ${dim}[y/N]${reset} "
    read -r reply
    [[ "$reply" =~ ^[Yy]$ ]]
}

# ─── Prerequisite Checks ─────────────────────────────────────────────────────

check_prerequisites() {
    header "Checking Prerequisites"

    local pass=true

    if command -v git &>/dev/null; then
        ok "git found at $(command -v git)"
    else
        fail "git not found — install with: brew install git"
        pass=false
    fi

    if command -v opencode &>/dev/null; then
        ok "opencode found at $(command -v opencode)"
    else
        fail "opencode not found in PATH"
        echo -e "     ${dim}Install from https://opencode.ai${reset}"
        pass=false
    fi

    if [ -d "$HOME/.config/opencode" ]; then
        ok "opencode config directory exists"
    else
        fail "~/.config/opencode/ does not exist"
        echo -e "     ${dim}Run opencode at least once to create it${reset}"
        pass=false
    fi

    if [ "$pass" = false ]; then
        echo ""
        fail "Prerequisites not met. Fix the issues above and try again."
        exit 1
    fi

    echo ""
    ok "${green}All prerequisites satisfied${reset}"
}

# ─── Detect Existing Install ─────────────────────────────────────────────────

is_installed() {
    [ -d "$SUPERPOWERS_DIR/.git" ]
}

# ─── Install ──────────────────────────────────────────────────────────────────

do_install() {
    header "Installing Superpowers"

    # Clone
    step "Cloning repository..."
    git clone --quiet "$REPO_URL" "$SUPERPOWERS_DIR"
    ok "Cloned to ${dim}$SUPERPOWERS_DIR${reset}"

    link_plugin_and_skills
}

# ─── Symlinks ─────────────────────────────────────────────────────────────────

link_plugin_and_skills() {
    local plugin_source="$SUPERPOWERS_DIR/.opencode/plugins/superpowers.js"
    local skills_source="$SUPERPOWERS_DIR/skills"

    # Verify expected files exist in the clone
    if [ ! -f "$plugin_source" ]; then
        fail "Expected plugin file not found: ${dim}$plugin_source${reset}"
        echo -e "     ${dim}The repo structure may have changed. Check the README.${reset}"
        exit 1
    fi

    if [ ! -d "$skills_source" ]; then
        fail "Expected skills directory not found: ${dim}$skills_source${reset}"
        echo -e "     ${dim}The repo structure may have changed. Check the README.${reset}"
        exit 1
    fi

    # Plugin symlink
    step "Registering plugin..."
    mkdir -p "$PLUGINS_DIR"
    rm -f "$PLUGIN_LINK"
    ln -s "$plugin_source" "$PLUGIN_LINK"
    ok "Plugin linked ${dim}$PLUGIN_LINK → $plugin_source${reset}"

    # Skills symlink
    step "Linking skills..."
    mkdir -p "$SKILLS_DIR"
    rm -rf "$SKILLS_LINK"
    ln -s "$skills_source" "$SKILLS_LINK"
    ok "Skills linked ${dim}$SKILLS_LINK → $skills_source${reset}"
}

# ─── Reinstall (overwrite) ────────────────────────────────────────────────────

do_reinstall() {
    header "Reinstalling Superpowers"

    step "Removing existing installation..."
    rm -f "$PLUGIN_LINK"
    rm -rf "$SKILLS_LINK"
    rm -rf "$SUPERPOWERS_DIR"
    ok "Cleaned up old files"

    do_install
}

# ─── Update ───────────────────────────────────────────────────────────────────

do_update() {
    header "Updating Superpowers"

    if ! is_installed; then
        fail "Superpowers is not installed. Run this script without --update first."
        exit 1
    fi

    step "Fetching latest changes..."
    local before after
    before=$(git -C "$SUPERPOWERS_DIR" rev-parse HEAD)
    git -C "$SUPERPOWERS_DIR" pull --quiet
    after=$(git -C "$SUPERPOWERS_DIR" rev-parse HEAD)

    if [ "$before" = "$after" ]; then
        ok "Already up to date ${dim}($before)${reset}"
    else
        ok "Updated ${dim}${before:0:8} → ${after:0:8}${reset}"
        echo ""
        step "Recent changes:"
        git -C "$SUPERPOWERS_DIR" log --oneline "${before}..${after}" | while read -r line; do
            echo -e "     ${dim}$line${reset}"
        done
    fi

    # Re-link in case paths changed
    step "Verifying symlinks..."
    link_plugin_and_skills

    print_done "updated"
}

# ─── Uninstall ────────────────────────────────────────────────────────────────

do_uninstall() {
    header "Uninstalling Superpowers"

    if ! is_installed; then
        warning "Superpowers is not installed. Nothing to do."
        exit 0
    fi

    if ! confirm "Remove Superpowers and all related symlinks?"; then
        echo ""
        step "Cancelled."
        exit 0
    fi

    step "Removing plugin symlink..."
    rm -f "$PLUGIN_LINK"
    ok "Removed ${dim}$PLUGIN_LINK${reset}"

    step "Removing skills symlink..."
    rm -rf "$SKILLS_LINK"
    ok "Removed ${dim}$SKILLS_LINK${reset}"

    step "Removing cloned repository..."
    rm -rf "$SUPERPOWERS_DIR"
    ok "Removed ${dim}$SUPERPOWERS_DIR${reset}"

    echo ""
    ok "${green}Superpowers has been uninstalled.${reset}"
    echo -e "  ${dim}Restart OpenCode to complete removal.${reset}"
    echo ""
}

# ─── Done Banner ──────────────────────────────────────────────────────────────

print_done() {
    local action="${1:-installed}"
    echo ""
    echo -e "  ${bold}${green}Superpowers ${action} successfully.${reset}"
    echo ""
    echo -e "  ${dim}Next steps:${reset}"
    echo -e "    1. Restart OpenCode"
    echo -e "    2. Verify by asking: ${cyan}\"do you have superpowers?\"${reset}"
    echo ""
}

# ─── Usage ────────────────────────────────────────────────────────────────────

usage() {
    echo ""
    echo -e "${bold}Usage:${reset} $(basename "$0") [command]"
    echo ""
    echo -e "  ${bold}install${reset}     Install Superpowers ${dim}(default)${reset}"
    echo -e "  ${bold}update${reset}      Pull latest changes"
    echo -e "  ${bold}uninstall${reset}   Remove Superpowers completely"
    echo -e "  ${bold}status${reset}      Show current installation status"
    echo -e "  ${bold}help${reset}        Show this message"
    echo ""
}

# ─── Status ───────────────────────────────────────────────────────────────────

do_status() {
    header "Superpowers Status"

    if is_installed; then
        local commit branch
        commit=$(git -C "$SUPERPOWERS_DIR" rev-parse --short HEAD 2>/dev/null || echo "unknown")
        branch=$(git -C "$SUPERPOWERS_DIR" branch --show-current 2>/dev/null || echo "unknown")
        ok "Installed at ${dim}$SUPERPOWERS_DIR${reset}"
        echo -e "     ${dim}branch: $branch  commit: $commit${reset}"
    else
        fail "Not installed"
    fi

    if [ -L "$PLUGIN_LINK" ]; then
        if [ -e "$PLUGIN_LINK" ]; then
            ok "Plugin symlink valid"
        else
            fail "Plugin symlink broken → $(readlink "$PLUGIN_LINK")"
        fi
    else
        fail "Plugin symlink missing"
    fi

    if [ -L "$SKILLS_LINK" ]; then
        if [ -e "$SKILLS_LINK" ]; then
            local count
            count=$(find "$SKILLS_LINK" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
            ok "Skills symlink valid ${dim}($count skills found)${reset}"
        else
            fail "Skills symlink broken → $(readlink "$SKILLS_LINK")"
        fi
    else
        fail "Skills symlink missing"
    fi

    echo ""
}

# ─── Main ─────────────────────────────────────────────────────────────────────

main() {
    local cmd="${1:-install}"

    case "$cmd" in
        install)
            check_prerequisites

            if is_installed; then
                warning "Superpowers is already installed at ${dim}$SUPERPOWERS_DIR${reset}"
                if confirm "Overwrite existing installation?"; then
                    do_reinstall
                else
                    echo ""
                    step "Cancelled. Use ${bold}update${reset} to pull latest changes instead."
                    echo ""
                    exit 0
                fi
            else
                do_install
            fi

            print_done "installed"
            ;;
        update)
            check_prerequisites
            do_update
            ;;
        uninstall)
            do_uninstall
            ;;
        status)
            do_status
            ;;
        help|--help|-h)
            usage
            ;;
        *)
            fail "Unknown command: $cmd"
            usage
            exit 1
            ;;
    esac
}

main "$@"
