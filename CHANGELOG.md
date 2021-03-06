Do this to generate your change history

    $ git log --date=relative --pretty=format:'  * %h - %s (%an, %ad)' 'package/pact-broker-0.0.PRODVERSION'..'package/pact-broker-0.0.NEWVERSION'

#### 0.0.10 (2014-03-24)

* 7aee2ae - Implemented version tagging (Beth, 2 days ago)
* cc78f92 - Added 'latest' pact url to pact representation in the 'latest pacts' response (Beth, 2 days ago)

#### 0.0.9 (2014-02-27)

* d07f4b7 - Using default gem publish tasks (Beth, 4 weeks ago)
* d60b7ee - Comment (Beth, 7 weeks ago)
* 836347c - Using local pacts (Beth, 7 weeks ago)
* a2cb2bb - Fixed bug querying mysql DB, rather than sqlite (Beth, 7 weeks ago)
* 9d5f83b - Using the to_json options to pass in the base_url instead of the nasty hack. (Beth, 4 months ago)
* adb6148 - Changed 'last' to 'latest' (Beth, 4 months ago)

#### 0.0.8 (2013-11-18)

* 6022baa - Changed name to title in list pacticipants response (Beth, 7 hours ago)
* 13fde52 - Moving resources module under the Api module. (Beth, 8 hours ago)
* f52c572 - Added HAL index (Beth, 8 hours ago)

#### 0.0.7 (2013-11-15)

* 7984d86 - Added title to each item in the pacts/latest links array (Beth, 83 seconds ago)

#### 0.0.6 (2013-11-15)

* 021faae - Refactoring resources to DRY out code (Beth, 18 hours ago)
* bab0367 - Cleaning up the base_url setting hack. (Beth, 19 hours ago)
* f6df613 - Renamed representors to decorators (Beth, 19 hours ago)
* 3e89c20 - Created BaseDecorator (Beth, 19 hours ago)
* e5c3f88 - Changing from representors to decorators (Beth, 19 hours ago)
* b2eeb6f - Added back resource_exists? implementation in pacticipant resource - accidental deletion. (Beth, 19 hours ago)
* 1962a05 - Ever so slightly less hacky way of handling PATCH (Beth, 21 hours ago)
* 587e9c1 - First go at trying to use a dynamic base URL - to be continued (Beth, 2 days ago)
* ab9c185 - Including URLs for the dynamically calculated latest pact, not the hard link to the latest pact. (Beth, 2 days ago)
* 5621e41 - Beginning change from Roar Representor to Decoractor. Updating to new 'latest pact' URL (Beth, 2 days ago)
* d1bd995 - Adding missing PactBroker::Logging require (Beth, 2 days ago)


#### 0.0.5 (2013-11-13)

* 2cf987c - Added data migration to script which adds order column (Beth, 56 minutes ago)
* 9c709a9 - Changing queries to use new order column. (Beth, 61 minutes ago)
* 173f231 - Renaming var (Beth, 65 minutes ago)
* f9be93d - Renamed SortVersions to OrderVersions (Beth, 66 minutes ago)
* ca6e479 - Added SortVersions as an after version save hook (Beth, 69 minutes ago)
* 23cd1a3 - Adding order column to version table (Beth, 11 hours ago)
* c504e5f - Fixing application/json+hal to application/hal+json (Beth, 2 days ago)
* 1d24b9b - Removing old sinatra API (Beth, 2 days ago)
* fd1832c - WIP. Converting to use Webmachine (Beth, 2 days ago)
* 0b096a4 - Redoing the the URLs yet again (Beth, 3 days ago)
* 0934d89 - Implementing list latest pacts (Beth, 3 days ago)
* ed2d354 - Changed one_to_one associations to many_to_one (Beth, 4 days ago)
* 28de0ea - WIP implementing pacts/latest. (Beth, 6 days ago)
* 1cd36e6 - Changing to new /pacts/latest URL format (Beth, 6 days ago)
* 54f8fc3 - Writing underlying code to find the latest pact for each consumer/provider pair. (Beth, 6 days ago)
