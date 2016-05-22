
	<cfquery datasource="capstoneDB">
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Alliance Clinic'), '680 Hillside Drive Stafford, VA 22554', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-5546' , '34.33324' , '-99.79715' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Animas Medical Clinic'), '992 Hill Street Long Beach, NY 11561', '24/7', '(555)555-4127' , '47.322998' , '-107.48112' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Bayhealth Hospital Center'), '438 Jackson Avenue Loveland, OH 45140', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-3180' , '33.067947' , '-108.04312' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Beacon Clinic'), '552 Mulberry Lane Marion, NC 28752', '24/7', '(555)555-5120' , '47.444023' , '-86.4949' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Bellevue General Hospital'), '475 Queen Street Eden Prairie, MN 55347', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-1865' , '31.828608' , '-96.23423' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Big Heart Community Hospital'), '525 Academy Street Chelmsford, MA 01824', '24/7', '(555)555-6807' , '33.408695' , '-116.35977' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Blessings Medical Center'), '637 Route 20 Enterprise, AL 36330', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-6678' , '38.593098' , '-104.88205' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Blessings Medical Center'), '935 Cedar Street San Jose, CA 95127', '24/7', '(555)555-2785' , '44.319374' , '-116.15471' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Charity Hospital Center'), '159 Edgewood Drive Enterprise, AL 36330', '24/7', '(555)555-3032' , '37.139442' , '-91.48037' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Charity Medical Clinic'), '816 Ann Street Maumee, OH 43537', '24/7', '(555)555-7475' , '34.94035' , '-92.21611' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Diamond Grove Medical Clinic'), '218 Central Avenue Front Royal, VA 22630', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-2303' , '46.854244' , '-105.38212' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Evergreen Hospital'), '148 Cross Street Bronx, NY 10451', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-7586' , '39.914726' , '-112.41382' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Evergreen Hospital'), '602 6th Avenue Key West, FL 33040', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-7650' , '35.556858' , '-85.255325' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Fairmont Clinic'), '626 Holly Drive Plattsburgh, NY 12901', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-2374' , '35.62148' , '-84.000275' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Featherfall General Hospital'), '254 Bay Street Fort Washington, MD 20744', '24/7', '(555)555-6208' , '40.563377' , '-86.119995' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Flowerhill Medical Clinic'), '188 Warren Avenue Sidney, OH 45365', '24/7', '(555)555-7321' , '39.31875' , '-108.97027' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Garden City Community Hospital'), '66 Orchard Avenue Dublin, GA 31021', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-3588' , '45.73434' , '-82.07243' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Goldriver Medical Clinic'), '27 Route 10 Gwynn Oak, MD 21207', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-0552' , '39.808098' , '-103.80304' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Grace Community Hospital'), '645 Woodland Road Twin Falls, ID 83301', '24/7', '(555)555-6416' , '45.646206' , '-102.844475' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Grand Oak Clinic'), '78 Myrtle Avenue Eugene, OR 97402', '24/7', '(555)555-1271' , '47.392956' , '-106.13657' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Grand Plains Community Hospital'), '692 Route 1 Elizabeth City, NC 27909', '24/7', '(555)555-7220' , '44.72941' , '-92.21831' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Grand University Hospital'), '74 Maple Avenue Woodstock, GA 30188', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-1267' , '35.319973' , '-113.22451' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Grand Valley Hospital Center'), '551 Route 4 Absecon, NJ 08205', '24/7', '(555)555-5540' , '43.795963' , '-83.11801' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Great Plains Medical Clinic'), '464 Washington Avenue Eastpointe, MI 48021', '24/7', '(555)555-2041' , '36.017628' , '-93.70594' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Great Plains Medical Clinic'), '58 Orchard Lane Potomac, MD 20854', '24/7', '(555)555-0724' , '37.458015' , '-108.91725' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Green Hill Hospital Center'), '78 Durham Court Meriden, CT 06450', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-2150' , '44.491547' , '-84.99047' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Greengrass Hospital'), '326 Bridge Street Casselberry, FL 32707', '24/7', '(555)555-3175' , '37.16043' , '-112.20345' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Greengrass Hospital Center'), '934 Oxford Road Allison Park, PA 15101', '24/7', '(555)555-3604' , '39.70759' , '-85.01499' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Greenwood General Hospital'), '307 8th Street Savannah, GA 31404', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-7073' , '35.408703' , '-106.99556' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Griffin Medical Center'), '114 Victoria Court Latrobe, PA 15650', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-4613' , '38.78128' , '-83.99763' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Griffin Medical Center'), '454 Railroad Street Cordova, TN 38016', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-2761' , '37.90962' , '-86.441124' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Griffin Medical Center'), '310 Railroad Avenue Clifton, NJ 07011', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-2667' , '33.77382' , '-110.68382' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Guardian Hospital Center'), '835 River Street Piedmont, SC 29673', '24/7', '(555)555-5688' , '36.049515' , '-100.54126' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Healthstone General Hospital'), '876 Locust Lane Hialeah, FL 33010', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-3581' , '46.667755' , '-82.78089' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Healthstone Medical Center'), '832 3rd Street West Huntersville, NC 28078', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-7466' , '46.126522' , '-110.97154' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Heart Center Medical Clinic'), '445 Broadway Royal Oak, MI 48067', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-7761' , '47.169044' , '-87.31912' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Heartstone Medical Clinic'), '293 Canterbury Drive Vicksburg, MS 39180', '24/7', '(555)555-8125' , '45.85822' , '-102.847885' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Hopevale Hospital'), '234 Windsor Court Northbrook, IL 60062', '24/7', '(555)555-2703' , '40.73125' , '-85.20802' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Jade Forest General Hospital'), '301 Ivy Lane Mobile, AL 36605', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-7704' , '45.978607' , '-108.95781' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Jade Forest General Hospital'), '899 Myrtle Avenue Venice, FL 34293', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-6646' , '34.297073' , '-92.15184' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Lakeside Medical Clinic'), '526 4th Street South Omaha, NE 68107', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-5204' , '31.691526' , '-98.31635' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Little River General Hospital'), '799 Dogwood Lane North Brunswick, NJ 08902', '24/7', '(555)555-7450' , '34.38085' , '-94.92157' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Lullaby Hospital Center'), '163 Howard Street Milwaukee, WI 53204', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-8666' , '45.362522' , '-83.961105' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Meadowview Hospital Center'), '148 John Street Harlingen, TX 78552', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-0342' , '40.633583' , '-110.70628' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Mineral Medical Clinic'), '824 Washington Street Boynton Beach, FL 33435', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-5463' , '37.266953' , '-81.761536' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'North Star Clinic'), '234 Virginia Street Rolla, MO 65401', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-3165' , '40.31575' , '-86.630325' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'North Star General Hospital'), '267 Willow Street Hagerstown, MD 21740', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-1742' , '42.30301' , '-103.6467' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Northshore Hospital Center'), '181 Cleveland Street Glen Cove, NY 11542', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-6306' , '31.4197' , '-81.283745' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Oakdale Hospital'), '260 Woodland Avenue Morrisville, PA 19067', '24/7', '(555)555-1735' , '43.70656' , '-111.33288' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Olympus Medical Clinic'), '722 Monroe Street Piqua, OH 45356', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-7681' , '42.479645' , '-83.82919' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Paradise Valley Community Hospital'), '211 Grant Avenue Round Lake, IL 60073', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-7427' , '31.94681' , '-97.68314' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Parkview Medical Center'), '447 Willow Avenue Mount Airy, MD 21771', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-6302' , '45.78915' , '-96.97471' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Parkview Medical Center'), '689 Ridge Street Fort Lauderdale, FL 33308', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-1223' , '34.33918' , '-92.43153' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Peace River General Hospital'), '506 Main Street East Plattsburgh, NY 12901', '24/7', '(555)555-6611' , '31.498636' , '-85.98825' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Peace River Medical Clinic'), '715 Main Street East Perkasie, PA 18944', '24/7', '(555)555-8088' , '39.376587' , '-84.99344' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Petunia Community Hospital'), '506 Academy Street Kissimmee, FL 34741', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-0340' , '33.988503' , '-93.33432' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Petunia Medical Center'), '932 Briarwood Drive Graham, NC 27253', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-2665' , '42.5902' , '-93.81914' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Pine Valley Hospital'), '458 Arlington Avenue Mansfield, MA 02048', '24/7', '(555)555-3351' , '36.70402' , '-115.8498' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Pine Valley Hospital'), '291 Aspen Court Valley Stream, NY 11580', '24/7', '(555)555-0446' , '36.015076' , '-101.18504' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Pinevale Hospital Center'), '485 Ridge Street Port Richey, FL 34668', '24/7', '(555)555-1327' , '47.281998' , '-111.576485' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Primary Clinic'), '48 Race Street Peoria, IL 61604', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-4740' , '36.728485' , '-113.608696' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Primary Hospital'), '210 Ashley Court Baton Rouge, LA 70806', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-2150' , '37.19529' , '-86.42311' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Principal Community Hospital'), '274 12th Street East Santa Cruz, CA 95060', '24/7', '(555)555-4161' , '43.66718' , '-109.10045' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Promise Clinic'), '960 Catherine Street Braintree, MA 02184', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-7210' , '43.30446' , '-83.53201' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Promise Medical Clinic'), '730 York Street Windermere, FL 34786', '24/7', '(555)555-1157' , '46.271038' , '-100.862015' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Rainbow Hospital Center'), '811 Edgewood Road Marquette, MI 49855', '24/7', '(555)555-3368' , '46.657494' , '-116.84532' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Rainbow Hospital Center'), '998 5th Street South Lemont, IL 60439', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-6825' , '40.31339' , '-97.37809' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Riverside Clinic'), '278 Lantern Lane Fenton, MI 48430', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-1167' , '34.06601' , '-83.610504' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Rosemary Medical Center'), '561 Homestead Drive Crown Point, IN 46307', '24/7', '(555)555-5541' , '38.858414' , '-110.75842' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Ruby Valley Clinic'), '363 Magnolia Drive Buford, GA 30518', '24/7', '(555)555-0718' , '31.018106' , '-84.826126' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silver Birch Clinic'), '390 Chestnut Avenue Lawrence Township, NJ 08648', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-6734' , '46.4115' , '-86.394' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silver Gardens Medical Center'), '534 Summer Street Lombard, IL 60148', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-3161' , '42.221054' , '-109.09958' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silver Hill Hospital'), '662 Walnut Street Glendale Heights, IL 60139', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-3880' , '36.65972' , '-97.22608' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silver Pine Medical Clinic'), '364 Pin Oak Drive Linden, NJ 07036', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-1485' , '34.51708' , '-87.31297' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silver Wing Community Hospital'), '264 Heather Lane Fremont, OH 43420', '24/7', '(555)555-6145' , '42.45974' , '-106.979' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silverstone Community Hospital'), '355 Lakeview Drive Acworth, GA 30101', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-3833' , '34.213078' , '-111.3875' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silverstone Community Hospital'), '454 Route 2 Ogden, UT 84404', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-5234' , '32.70457' , '-103.834305' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Silverwood Medical Clinic'), '288 Harrison Avenue Jamaica Plain, MA 02130', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-8428' , '42.421303' , '-105.77005' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Spring Hill Medical Clinic'), '749 9th Street Indiana, PA 15701', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-5133' , '39.93186' , '-85.19972' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Springfield Clinic'), '732 West Street Lansdale, PA 19446', '24/7', '(555)555-7580' , '37.29055' , '-99.72725' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Springfield Clinic'), '184 Columbia Street Eden Prairie, MN 55347', '24/7', '(555)555-7580' , '41.691223' , '-109.73674' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Springfield Medical Center'), '612 Locust Street Brainerd, MN 56401', '24/7', '(555)555-8665' , '46.790154' , '-111.58341' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Springfield Medical Center'), '220 Henry Street Kalamazoo, MI 49009', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-7278' , '43.90647' , '-92.88967' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Springhill Community Hospital'), '41 Roberts Road Buffalo Grove, IL 60089', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-5878' , '38.373146' , '-100.155106' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Springhill General Hospital'), '595 4th Street West Amarillo, TX 79106', '24/7', '(555)555-1463' , '33.613663' , '-96.45062' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Summerhill Hospital Center'), '558 Clark Street Northbrook, IL 60062', '24/7', '(555)555-0755' , '34.28744' , '-99.17776' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Summerhill Hospital Center'), '257 Adams Street Marquette, MI 49855', '24/7', '(555)555-0862' , '31.006805' , '-98.46935' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Summit Clinic'), '424 Jefferson Avenue Salt Lake City, UT 84119', '24/7', '(555)555-7640' , '45.219414' , '-93.88128' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Tranquil Valley General Hospital'), '802 Cleveland Street Gaithersburg, MD 20877', '24/7', '(555)555-7507' , '41.17475' , '-105.98584' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Tranquility Medical Center'), '668 Cherry Lane Sioux City, IA 51106', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-8722' , '35.729256' , '-94.10863' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Trinity Hospital Center'), '871 Jones Street Clover, SC 29710', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-1762' , '44.854744' , '-98.16297' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Tulip Hospital Center'), '789 South Street Bellmore, NY 11710', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-3606' , '44.11638' , '-94.192055' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Valley Health Clinic'), '424 Church Street Mansfield, MA 02048', '24/7', '(555)555-1142' , '45.205006' , '-103.842865' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'White Blossom Clinic'), '527 New Street Inman, SC 29349', '24/7', '(555)555-1650' , '47.59659' , '-96.393265' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'White Feather General Hospital'), '236 Grand Avenue Camp Hill, PA 17011', '24/7', '(555)555-6817' , '41.5707' , '-93.578285' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'White Feather General Hospital'), '655 12th Street Faribault, MN 55021', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-4623' , '38.360218' , '-101.51435' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'White Petal Clinic'), '362 Elmwood Avenue New Orleans, LA 70115', '<ul><li>Sunday: Closed</li><li>Monday: 5:00am - 9:00pm</li><li>Tuesday: 5:00am - 9:00pm</li><li>Wednesday: 7:00am - 4:00pm</li><li>Thursday: 5:00am - 9:00pm</li><li>Friday: 5:00am - 9:00pm</li><li>Saturday: 5:00am - 10:00pm</li></ul>', '(555)555-0123' , '35.84482' , '-83.03604' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'White River Hospital'), '640 8th Street South Mocksville, NC 27028', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-8750' , '47.161674' , '-97.440186' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'White Willow Medical Clinic'), '638 Franklin Court Nashua, NH 03060', 'Monday-Friday: 7:00am - 10:00pm', '(555)555-4311' , '40.849834' , '-95.65198' );
INSERT INTO Location (Provider_ID, address, hours, phone, geo_lat, geo_lng) VALUES (( SELECT ID FROM Provider WHERE name = 'Woodland General Hospital'), '211 Route 2 Helena, MT 59601', '24/7', '(555)555-6030' , '31.527714' , '-87.22666' );
UPDATE LOCATION SET geo_lat = 0, geo_lng = 0;
	</cfquery>

Locations Inserted
