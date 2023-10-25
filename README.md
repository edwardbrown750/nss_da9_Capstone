## **Crime, City Services, and Resident Satisfaction in Nashville (2016-2018)**
*Capstone Project for Part Time Data Analytics Cohort #9 Program at Nashville Software School.* 

### **Contents**  
- [Motivation](#Motivation)
- [Data Questions](#Data-Questions)
- [Known Issues and Challenges](#Known-Issues-and-Challenges)
- [Data Sources and Tools](#Data-Sources-and-Tools)
- [Links to Tableau Public and Video](#Links-to-Tableau-Public-and-Video)
- [Schedule](#Schedule)
- [Approach Outline](#Approach-Outline)
- [Acknowledgements](#Acknowledgements)

**Nashville has seen an explosion of growth over the past decade and a half. With that growth comes the nearly inevitable increase in crime that, sadly, all cities struggle with as more and more people cluster closer together. With this project, I wanted to see which areas of the city are most impacted by crime; how it's coloring their perceptions of crime prevention and police efforts; see if there's a correlation that we can detect between those areas and other areas of city services; and offer any recommendations I can find to improve conditions.

### **Motivation**   
I've been a Metro Nashvillle Government employee - serving as Public Information Officer at Nashville Public Library - for nearly five years now. Nearly every day, I walk to work at the Main Library in Downtown Nashville and watch the city change. I interact with people from all walks of life who come into our library seeking enrichment, community, entertainment, and in some cases, relief from their everyday lives. Some of those people live in the areas highly impacted by crime that I identify in this project. Helping people like them inspires much of what I do in my professional life.

Crime - and it's impact on a city - has always been an area of interest to me. Next to the economy, it seems like whenever dissatisfaction with a city, neighborhood, or government comes up, crime is involved. Since tracking, cataloguing, and archiving criminal activity involves huge amounts of data, I felt like this project would give me the chance to exercise the skills I've learned in this course, challenge myself with a relatively amount of data, and bring those two aspects together through a topic that interesets me.

Finally, I got into this field because I've seen the power of data-driven decision-making to improve efficiency, avoid wasted time, and simply make people's jobs easier. I saw it during my eight years of service in the U.S. Army, and I've seen it through nearly seven years of professional marketing roles. I love everything about exploring data, and I wanted to be a part of it.
*Back to [Contents](#Contents)*


### **Data Questions**  
- What areas of Nashville are most impacted by crime? 
- Are the residents in those areas more dissatisfied with crime and police than other areas?
- Does living in a high-crime areas skew residents’ perceptions of other city services, as well?
- Can anything be done to improve conditions?
   

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
While much of this project hinges on tying everything together with the Metro Resident Survey responses, there are extensive limitations in the Survey dataset which forces this project to serve as a proof-of-concept model, instead of a tool for decision-making today, including:

- The Survey concluded in 2018, and a new one has not been initiated, meaning these responses (and the views represented) are now five years old. 
- Before filtering, there were only 2,171 responses to the Survey; the population of Nashville was roughly 650,000 in 2018, meaning the Survey's respondents represented less than 1% of the population at the time.
- The responses are heavily skewed to about 15 of the 25 original ZIP codes represented; in some cases, there were as few as 1 response per ZIP code; I chose to remove any ZIPs that did not have at least 10 responses to avoid skewing results without at least something reminiscient of a variety of perspectives.
![Survey Response example](./assets/survey_response_example.PNG)


**Action-Limited Status in MNPD Incidents**
- Within the original data, I found instances where an incident was closed because it was either a false report, the victim was uncooperative, or the victim refused to prosecute. While this is viable data for further analysis, it was not the focus of my project as I wanted only incidents where the police/criminal justice system could take futher action, so I removed these incidents from the data.
![MNPD Status example](../assets/survey_response_example.PNG)

**Permits Issued - Duplicates**  
- Additional permits sometimes issued for a single address and single project, many months later with new permit number. I chose to retain duplicates to avoid corrupting valid data
![Survey Response Example](../assets/mnpd_status_example.PNG)

    
*Back to [Contents](#Contents)*

### **Links to Tableau Public and Video**
- Video Presentation (7 minutes):  https://www.loom.com/share/8d10d5b408dd48d6925f22b7d6a006f2 
- Tableau Public: https://public.tableau.com/profile/loributler#!/vizhome/Whats_Happening_in_my_Neighborhood_an_Exploration_into_Nashvilles_Growth/Story1?publish=yes  
*Back to [Contents](#Contents)*

### **Schedule**
5/22/2020 ..... Get the data   
6/08/2020 ..... Clean and explore the data, define the MVPs for the charts and the dashboard   
6/15/2020 ..... Research correlations, create charts and dashboard draft  
6/24/2020 ..... Internal demo  
6/25/2020 ..... Demo Day!     
*Back to [Contents](#Contents)*

### **Approach Outline:**    
To track progress on each step I'm using the Project (Kanban) board in the GitHub repository. 
- **ETL** to extract the data from data.nashville.gov; examine it to determine what transformation may be needed (if any), and then load it into Python
- Determine what the **MVP** (minimum viable product) looks like for charts and for the intaractive dashboard
- **EDA** (exploratory data analysis). Outline of primary steps (not a comprehensive list of *all* steps)  
    - Examine data types (esp. dates and geography/location/lat&lng)  
    - Look for nulls  
    - Understand what unique values are in each column and seeing which ones are most prevelant and most relevant to answering the data questions
    - Examine statistics for each series with numerical values  
- Determine the best methods for either merging and/or subsetting the data to facilitate creating the charts and creating the dashboard, and explore the answers to the data questions
- Validate that the charts are showing information correctly, with no *irrelevant* data included, and no *relevant* data inadvertently excluded
- Create charts and graphs
- Create dashboard
- Prepare presentation and record demo    
*Back to [Contents](#Contents)*


### **Acknowledgements**
It is challenging to find powerful enough words to describe my gratitude for the instructors and staff at  **Nashville Software School.** 
- Unending thanks to our superb instructors - the inimitable **Mary van Valkenburg,** Program Mgr/Instructor and **Mahesh Rao,** Instructor. 
    - They embraced the challenge of designing NSS's first-ever full time data analytics course - squeezing an impossible amount of training into 15 short weeks. 
    - Then on the third day of class they had to pivot to 100% remote learning due to the novel coronavirus pandemic... and they did so brilliantly! 
- I am indebted to **John Wark,** Founder and CEO, and **all staff** of NSS for their commitment to providing opportunities to those who are underrepresented in technology fields. They have created an incredible organization. 
- **Kristin McKinney,** Partner Development Mgr., has provided an amazing amount of support for our upcoming job search: Three rounds of resume reviews, several mock interviews, panel discussions with local data analysts and hiring managers, demo day, and so much more. You rock!
- **My classmates** were awesome! Each person provided great examples of perseverence, patient collaboration, and the value of having Friday Zoom background themes. 

My career transition was inspired by my husband, **Landry Butler.** It's great to be on this journey together! We are both graduating from NSS's data analytics courses on June 25, 2020 - him from the part time/evening course, and me from the full time/day course. I'm continually inpired by Landry's patience, creativity and easy laughter. Fun times ahead!    
*Back to [Contents](#Contents)*