# Unified Release notes for v1.0.0 - Feb 15th, 2018

## Expectations for functionality:

1. UI - Mobile and Web
   * Allow the user to create a text-only post. 
   * Create an account and be authenticated.
   * Filter sources by category.
   * Basic chat service.
   * Allow user to lightly personalize account (add a profile picture from their phone)
     - ^ This would be experimental, and shoud now take precedence
2. Back End Services
   * Able to handle API requests, as well as handle page routing.
   * Set up development API keys for developers to interact with our systems (more on that later).
   * Prepare infrastructure for BM addition, as well as data processing capabilities.
   * Ensure databases working as intended, and that the existing system can perform under load.
3. Possible Solutions
   * With busy schedules, this may be a tough goal to reach. I am considering allowing (1) person to join the team, with Deon's approval. Should this be the case, they must be full stack with an emphasis in front end to assist with general UI and UX design and ensuring we can bring this to market before the pitch conference with IT at Grand Valley.
   * Current contenders:
     * Kyle Flynn (Full Stack Emphasis)
     * Michael Hurley (UI Emphasis)

# Unified Release notes for 1.1.0 - March 3rd, 2018

## Expectations for functionality:

This would be considered our first production release. Aside from the UI being completely done, we need to allow the back end to be perfected so that way when it comes time for Bad Meat to be re-implemented there will be no hiccups in the migration.

1. UI/UX
   * User interface and experience need to be refined. Color schemes need to be selected and stuck with, and modularity of content MUST be implemented to allow for other schools to be added.
   * Pictures MUST be supported.
   * Chat service of some kind MUST be implemented.
   * Creation of new accounts outside of the Grand Valley namespace should be anticipated (at a later date).
   * Allow for a development API. This will allow for those who are interested to interact with our API and prepare "threads" of categories in which they are interested in. (Create modular thread service)
2. Back End
   * Host service on docker for developers, and consider this in production as well.
   * Lock down api and check security of web services.
   * Create database to allow for developer access to the API.
   * Be prepared to support outages and make fault tolerant systems.
   * Implement some form of chat service.
3. Additional Considerations:
   * Work load here will definitely increase, and I personally feel at or before this point, getting another person on the team is imperative to our overall success.
   * This is where we would begin getting licensing established, company status, and school funding.
   * The app needs to be working at full capacity at this point, including unit tests, and all other relevant functionality.

# Unified Release notes for 1.2.0 - Summer '18

This is release time to production, full student body access, school support etc.

1. UI/UX 
   * No XSS issues, sanitized inputs, etc.
   * Full account modularity (profile picture, ratings, saving, etc).
   * UI complete and modular based on institution.
   * PAYMENTS SYSTEM MUST BE IMPLEMENTED.
   * Prepare to support updates and roll out new released (mobile)
2. Back End
   * Prepare for load, secure system as well.
   * Set up testing server for preparing new changes to be released to production.
   * Enable payments system in the back end if needed, store NO confidential data.
3. Additional Considerations:
   * At this point it is fully imperative we have an additional person on the team. 2 people simply are unable to support this system with jobs, school, and other things to worry about.
   * Pushing out our product to other institutions is the only way we will be successful, and we need to be aware of the risks that come along with moving this to another environment. Namely, hacking, scripting attacks on the websites, and DDOS issues. 

# Looking toward the future

Once the client list grows > 2 we will need a team of at least 4-5, 4 development staff and one business lead to push the product, a