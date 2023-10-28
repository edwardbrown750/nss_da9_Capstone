## **Crime, City Services, and Resident Satisfaction in Nashville (2016-2018)**
*Capstone Project for Part Time Data Analytics Cohort #9 Program at Nashville Software School.* 

### **Contents**  
- [Motivation](#Motivation)
- [Data Hypothesis and Questions](#Data-Hypothesis-and-Questions)
- [Data Sources and Tools](#Data-Sources-and-Tools)
- [Known Issues and Challenges](#Known-Issues-and-Challenges)
- [Links to Tableau Public and Video](#Links-to-Tableau-Public-and-Video)
- [Schedule](#Schedule)
- [Approach Outline](#Approach-Outline)
- [Conclusions and Recommendations](#Conclusions-and-Recommendations)
- [Acknowledgements](#Acknowledgements)

Nashville has seen an explosion of growth over the past decade and a half. With that growth comes the nearly inevitable increase in crime that, sadly, all cities struggle with as more and more people cluster closer together. With this project, I wanted to see which areas of the city are most impacted by crime; how it's coloring their perceptions of crime prevention and police efforts; see if there's a correlation that we can detect between those areas and other areas of city services; and offer any recommendations I can find to improve conditions.

### **Motivation**   
I've been a Metro Nashvillle Government employee - serving as Public Information Officer at Nashville Public Library - for nearly five years now. Almost every day, I walk to work at the Main Library in Downtown Nashville and watch the city change. I interact with people from all walks of life who come into our library seeking enrichment, community, entertainment, and in some cases, relief from their everyday lives. Some of those people live in the areas highly impacted by crime that I identify in this project. Helping people like them inspires much of what I do in my professional life.

Crime - and its impact on a city - has always been an area of interest to me. Next to the economy, it seems like whenever dissatisfaction with a city, neighborhood, or government comes up, crime is involved. Since tracking, cataloguing, and archiving criminal activity involves huge amounts of data, I felt like this project would give me the chance to exercise the skills I've learned in this course, challenge myself with a relatively large amount of data spread over multiple datasets, and bring those two aspects together through a topic that interesets me.

Finally, I got into this field because I've seen the power of data-driven decision-making to improve efficiency, avoid wasted time, and simply make people's jobs easier. I saw it during my eight years of service in the U.S. Army, and I've seen it through nearly seven years of professional marketing roles. I love everything about exploring data, and I wanted to be a part of it.

*Back to [Contents](#Contents)*


### **Data Hypothesis and Questions**  
**Data Hypothesis**
I started this project with the hypothesis that areas that were most impacted by crime would also have higher volumes who were overall dissatisfied with crime prevention and policing efforts overall. I also hypothesized that areas most impacted by crime would also be more dissatisfied in other areas of their neighborhoods, in areas such as city services, neighborhood appearance, etc. I framed my data questions with these hypothesis in mind.

**Data Questions**
1. What areas of Nashville are most impacted by crime? 
2. Are the residents in those areas more dissatisfied with crime and police than other areas?
3. Does living in a high-crime areas skew residents’ perceptions of other city services, as well?
4. Can anything be done to improve conditions?

*Back to [Contents](#Contents)*   

### **Data Sources and Tools**   
**Data Sources**   
The Metro Nashville Government maintains [an open record portal](https://data.nashville.gov) with access to a wide array of tables and databases that record various aspects of Metro activities in Nashville. 

I used three of these datasets to complete this project:
- [Metro Nashville Police Deparment Incidents](https://data.nashville.gov/Police/Metro-Nashville-Police-Department-Incidents/2u6v-ujjs 'incident in Nashville'): this table contains information about various incidents that Metro Police have responded to, the date/time it occured, what type of incident it was, where it occured, how many vicitms, etc.
- [hubNashville (311) Service Requests](https://data.nashville.gov/Public-Services/hubNashville-311-Service-Requests/7qhx-rexh 'requests for service from Metro Nashville'): this dataset contains requests from city residents for a wide array of services from the city, including garbage removal, streets and sidewalks improvement, permit requests, and more.
- [Metro Resident Survey Responses (2018)](https://data.nashville.gov/General-Government/Metro-Resident-Survey-Responses/nux7-cwab 'responses from 2018 survey'): This dataset contains ratings by residents of Metro Nashville about various facets of life in the city, including Quality of Life, Crime Prevention, Schools, Trash Services, Elected Officials, and much more. The survey results are catalogued by ZIP code, with responses either in a "Very Dissatisfied, Dissatisfied, Neutral, Satisfied, Very Satisfied, Don't Know" or "Yes or Now" categories.    
*Back to [Contents](#Contents)*


**Data Security and Safety**
All three datasets I used for this project are considered open data and readily accessible to anyone through Nashville's data portal. There is no PDI that could inextricably expose the identities of anyone in this data (no names, social security numbers, dates of birth, personal addresses, phone numbers, etc.)

**Tools**
- `Python`, version 3.10.9   
- `Jupyter Notebook`, version 6.5.2   
- `Power BI`, version 2.122.746.0 64-bit (October 2023)
- `MS Excel`, Microsoft 365       
*Back to [Contents](#Contents)* 


### **Known Issues and Challenges** 
  
**Issues with Survey Responses** 
While much of this project hinges on tying everything together with the Metro Resident Survey responses, there are extensive limitations in the Survey dataset which forces this project to serve as a proof-of-concept, instead of a tool for decision-making, including:

- The Survey concluded in 2018, and a new one has not been initiated, meaning these responses (and the views represented) are now five years old and most likely do not accurately reflect residents' views today. 
- Before filtering, there were only 2,171 responses to the Survey; the population of Nashville was roughly 650,000 in 2018, meaning the Survey's respondents represented less than 1% of the population at the time.
- The responses are heavily skewed to about 15 of the 25 original ZIP codes represented; in some cases, there were as few as 1 response per ZIP code; I chose to remove any ZIPs that did not have at least 10 responses to avoid skewing results without at least something reminiscient of a variety of perspectives.
![Survey Response example](/assets/survey_response_example.png)


**Considerations in MNPD Incidents**
- MNPD is noted for frequest collaborations with the police departments of neighboring counties and cities; within this report, there were instances of an incident that actually concluded in a ZIP that was outside of Davidson County; I removed these as I wanted incidents which were contained within Davidson County.
- Within the original data, I found instances where an incident was closed because it was either an unfounded report, the victim was uncooperative, or the victim refused to prosecute. While this is viable data for further analysis, it was not the focus of my project as I wanted only incidents where the police/criminal justice system could take futher action, so I removed these incidents from the data.
![MNPD Status example](/assets/mnpd_status_example.png)


**hubNashville ZIP Codes Mismatch**  
- Much like MNPD Incidents, the hubNashville dataset contained ZIP Codes that feel outside of Davidson County, were formatted differently (float vs. int vs. string), and in one case simply read 'TN'. I changed all floats to intergers, removed any ZIPs outside of Davidson County and did not specify a ZIP code.


**Narrowing Focus to Give Accurate Results**
Given the relatively restricted timeline for this project, I had to be very concious about which field(s) would be support generating the answers I wanted to give for this project. For example: within the Survey, there were fields for 'Police Overall', 'Police Response Time', 'Police Professionalism', etc. All these fields could contain valueble insights, but when measured against the time I had available - and the outcome I wanted to achieve - I chose to measure against the 'Police Overall' field only.

*Back to [Contents](#Contents)*


### **Links to Tableau Public and Video**
- WILL UPLOAD THIS LATER 

*Back to [Contents](#Contents)*

### **Schedule**
10/12/2023 ..... Get the data   
10/19/2023 ..... Clean and explore the data, define the MVPs for the charts and the dashboard   
10/21/2023 ..... Research correlations, create charts and dashboard draft  
10/26/2023 ..... Internal demo  
11/02/2023 ..... Demo Day!
     
*Back to [Contents](#Contents)*

### **Approach Outline:**  
- **ETL** to extract the data from data.nashville.gov; examine it to determine what transformation may be needed (if any), and then load it into SQL/Python
- Determine which categories (columns/fields) in the Resident Survey best tie to the MNPD Incidents and hubNashville Requests datasets. 
- Determine what the **MVP** (minimum viable product) looks like for charts and for the intaractive dashboard
- **EDA** (exploratory data analysis). Outline of primary steps (not a comprehensive list of *all* steps)  
    - Examine data types (esp. dates and geography/location/lat&lng)  
    - Look for nulls
    - Ensure ZIP Codes fall within Davidson County  
    - Understand what unique values are in each column and seeing which ones are most prevelant and most relevant to              
      answering the data questions
    - Examine statistics for each series with numerical values  
- Determine the best methods for either merging and/or subsetting the data to facilitate creating the charts and creating the dashboard, and explore the answers to the data questions
- Validate that the charts are showing information correctly, with no *irrelevant* data included, and no *relevant* data inadvertently excluded
- Create charts and graphs
- Prepare presentation and record demo 
- Create dashboard
   
*Back to [Contents](#Contents)*


### **Conclusions and Recommendations**
**Conclusions**
First and foremost, my original hypothesis proved untrue in most cases. In the Top 10 ZIP codes where crime - especially violent crime - was most prevelant, only 5 were also in the Top 10 ZIP codes most dissatisfied with crime prevention and police overall. 

Additionally, while a predominately large number of requests submitted through hubNashville came from areas where crime is most prevelant - and those same ZIP codes were also in the Top 10 areas where requests took longer than 7 days to resolve - only 3 on average were most dissatisfied with city services such as Trash and Debris; Streets, Roads, and Sidewalks; and Codes Enforcement (i.e. resolving property violations).

I also found that only 4 ZIP Codes demonstrated a strong overlap between being a high-crime area, being most dissatisfied with crime prevention and police, was an area where requests took longer to resolve, and were in the Top 10 areas most dissatisfied with those services:
- 37013 Antioch
- 37115 Madison
- 37207 Brooklyn Heights
- 37208 North Nashville/Germantown

Finally, I found that there's - in many cases - insufficient data to verify whether the feelings expressed by residents was matched by the reality in a given area. For example: one area I didn't specifically cover in this presentation was a survey column about Police Response Time. I found that it generally trended to be more-dissatisfied in most ZIP Codes, but there's no data in our MNPD Incidents dataset that quantifies the timelapse between when an incident is reported and when an officer first arrives on the scene. This is true for many other areas besides crime and police, as well.

**Recommendations**
My first - and highest priority - recommendation is that a new Metro Resident Survey be initiated. This data is now 5 years old, and as such, most likely doesn't accurately reflect how Metro residents feel today. The city has changed immensely in the past 5 years, and to provide any value, something like this survey can't be treated as a "one and done" deal. Specifically, I recommend the survey be conduct once every 4 years, and I further recommend that it be conducted during the year in which the Nashville Mayoral and Metro Council elections are held. This would both make it a recurring item that residents know to expect, and provide a valuable tool for new mayors/council members to gauge how residents are perceiving our city in their respective neighborhoods and districts.

Additionally - if a new survey is conducted - I strongly recommend that Metro finds a way to both increase the number of respondents, and fosters high participation across ZIP codes. As previously noted in the Known Issues and Challenges portion, a very small amount of residents participated in this survey, and some ZIP codes provided very, very few responses. It's difficult to make specific, city-wide policy if administrators cannot get a well-rounded, diverse view of what's going on in the city.

Finally, I recommend that any collected datasets involving the MNPD and other law enforcement agencies include data on when an officer first arrives on scene. Not only is this indisipensible for validating survey responses related to response time, it's also useful for gauging areas such as: is the officer-to-resident ratio sufficient to effectively police the city; are there specific ZIP codes where response times are slower; does this reveal any biases in policing or could it be tied to the number of patrol vehicles MNPD maintains or the road infrastructure allowing for faster travel? All of these are excellent data points worth exploring, but which cannot be elaborated on if we don't have the initial call-for-service-to-initial-contact data to analyze.

*Back to [Contents](#Contents)*


### **Acknowledgements**
When I started this course, I wasn't sure what to expect. What's more, I was nowhere near convinced that I had the capacity to transition into data analytics. Now, six months later, much of those doubts are void, and it's because of the unwavering support from the instructors, staff, and fellow students at  **Nashville Software School.** 
- I cannot begin to express the depths of gratitude I feel toward our instructors - **Dibran Rexhepi,** **Olariche "Ola" Obe,** **Alex Wright,** and **Sobiya Uddin.** These four folks absolutely floored me with their patience, their knoweldge, their willingness to do whatever was required to help a student, and their devotion to making sure not only that we pass this course, but that we truly understand what we can and must do to succeed as data analysts.
- I am indebted to **Ashley Canino,** and **Michael Frieh** of NSS's Career Development Team for their tirless work to provide career development tools, Q&As with working data analysts, resume building and review sessions, mock interview opprotunities, and the countless hours spent coordinating Demo Day and other opportunities for students. 
- **Zoe Teets,** a graduate of NSS who came back not once, but three times to coach us on Power BI, Tableau, and other topics, and who provided the most candid, inside-look at the life of a data visualization specialist I've seen thus far!
- **My classmates in DA Cohort #09**: They say that shared suffering is what truly builds a team. I don't know if you could truly call the last six months "suffering", but they were - without a shred of doubt - filled with fear, frustration, and doubt along the way. Fortunately, this class rallied together like few groups I've ever been a part of. Whether it was taking the time to demonstrate a successful way to resolve a problem, or just offering words of encouragement in times of stress, my classmates in DA9 had my back the whole time, and all I can say is that I'll never truly be able to repay their kindess, and can only hope that I was able to give them what they needed to thrive, as well.

*Back to [Contents](#Contents)*
