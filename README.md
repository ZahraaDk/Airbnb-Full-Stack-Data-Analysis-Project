
<img  src="./readme/title1.svg"/>

<div>

> Hello world! This is the project’s summary that describes the project, plain and simple, limited to the space available.
**[PROJECT PHILOSOPHY](#project-philosophy) • [PROTOTYPING](#prototyping) • [TECH STACKS](#stacks) • [IMPLEMENTATION](#demo) • [HOW TO RUN?](#run)**

</div> 
  

<br><br>

<!-- project philosophy -->

<a  name="philosophy" ></a>
<img  src="./readme/title2.svg" id="project-philosophy"/>

> A Python-based ETL project that extracts, transforms, and loads data from various resources into a tabular database (PostgreSQL). This project's objective is to offer a comprehensive analysis of the San Diego Airbnb market, enabling insights into property pricing, host performance, and guest reviews. 

<br>

  

### User Types

 

1. Data Engineers.
2. Data Analysts.
3. Airbnb Hosts.
4. Travelers/Guests.
5. Business Owners.
  

<br>

  

### User Stories

  
1. As a Data Engineer:
	I want to automatically scrape various economic indicators from reputable sources so that our dataset is always up-to-date.
	I want to integrate different data sources seamlessly.
	Ensure fault tolerance in our data pipelines, so that potential failures don't interrupt our analyses.
2. As an Analyst:
	I want to query the database.
	I want to view the sentiment analysis results to understand public sentiment around economic conditions.
	I want to visualize the data using PowerBI.
3. As an Airbnb Host:
	I want to access market insights so that i can optimize my property listings and pricing strategies. 
	I want to review guest sentiment analysis results so that I can improve the overall guest experience in my listings.
4. As a Traveler/Guest:
	I want to use this data to make decisions when selecting accommodations.
	I want to understand pricing trends so that I can make budget-conscious choices. 
5. As a Business Owner:
	I want to conduct competitive analyses using this data so that I can stay competitive in the market.
	I want to understand guest review sentiments.
	I want to use market insights for tailored services and marketing efforts so that my business aligns with customer expectations and attracts more clients.


<br><br>

<!-- Prototyping -->
<img  src="./readme/title3.svg"  id="prototyping"/>

> We have designed our projects to perform ETL processes, integrate data, and include it in a PowerBI Sample Dashboard.

  

### Logger File

  

| Bins Map screen | Dashboard screen | Bin Management screen |

| ---| ---| ---|

| ![Landing](./readme/wireframes/web/map.png) | ![Admin Dashboard](./readme/wireframes/web/dashboard.png) | ![User Management](./readme/wireframes/web/bin_crud.png) |

  
  

### Data Flow Diagrams

  

| Map screen | Dashboard screen | Bin Management screen |

| ---| ---| ---|

| ![Map](readme/mockups/web/map.png)| ![Map](./readme/mockups/web/dashboard.png)| ![Map](./readme/mockups/web/bin_crud.png)|

  
  

| Announcements screen | Login screen | Landing screen |

| ---| ---| ---|

| ![Map](readme/mockups/web/announcements.png)| ![Map](./readme/mockups/web/login.png)| ![Map](./readme/mockups/web/landing.png)|

<br><br>

  

<!-- Tech stacks -->

<a  name="stacks"></a>
<img  src="./readme/title4.svg" id="stacks" />

<br>

  

Bin Tracker is built using the following technologies:

  

## Frontend

Interactive PowerBI Dashboard:
A central dashboard where viewers can view:

1. Airbnb Insights: Graphs, charts and visualizations displaying key insights into the Airbnb market over time. Gain deep understading of trends, pricings, property types, and host performance.
2. Sentiment Analysis: Representations of guest review sentiments for Airbnb experiences using interactive representations, including heat maps
3. Interactive filters: options to filter data by date, region, or specific economic indicatiors for customized views.


  

<br>

  

## Backend

1. ETL Pipeline: using python and pandas, raw data is extracted, transformed into a usable format and loaded into postgreSQL database.
2. Database: Schema Design - Indexing - Data Integrity - Backup & Recovery.
3. Sentiment Analysis: Applying sentiment analysis in the ETL process to extract sentiment from the reviews. 

<br>

<br>

  

<!-- Implementation -->

<a  name="Demo"  ></a>
<img  src="./readme/title5.svg" id="#demo"/>

> Show command line of ETL performance - Logger view

  
### App


| Dashboard Screen | Create Bin Screen |

| ---| ---|

| ![Landing](./readme/implementation/dashboard.gif) | ![fsdaf](./readme/implementation/create_bin.gif) |

  

| Bins to Map Screen |

| ---|

| ![fsdaf](./readme/implementation/map.gif) |

  
  

| Filter Bins Screen | Update Pickup Time Screen |

| ---| ---|

| ![Landing](./readme/implementation/filter_bins.gif) | ![fsdaf](./readme/implementation/update_pickup.gif) |

  
  

| Announcements Screen |

| ---|

| ![fsdaf](./readme/implementation/message.gif)|

  
  

| Change Map Screen | Edit Profile Screen |

| ---| ---|

| ![Landing](./readme/implementation/change_map.gif) | ![fsdaf](./readme/implementation/edit_profile.gif) |

  
  

| Landing Screen |

| ---|

| ![fsdaf](./readme/implementation/landing.gif)|

  

<br><br>

<!-- ### Machine Learning (ML) component
Using Keras, we analyze the historical economic data, training predictive models and deploying them for real-time predictions.

  Data Collection & Preprocessing.
  Model Selection & Training
  Model Evaluation.
  Model Deployment -->
  

| ML Flow Diagram|

| ---| ---|

|![fsdaf](./readme/implementation/arduino.gif)|![fsdaf](./readme/implementation/circuit.png)

  

| Data Transfer Demo |

| ---|

| ![fsdaf](./readme/implementation/arduino_data.png) |

<br><br>


<!-- How to run -->

<a  name="run"  ></a>
<img  src="./readme/title6.svg" id="run"/>
  

> To set up ## **USA Recession Analysis and Prediction** follow these steps:

### Prerequisites


**Hardware & Software**:

-   A computer/server with sufficient RAM and processing power.
-   Operating system: Linux (preferred for production) or Windows.
-   Required software: Python (3.x), PostgreSQL, Git (for version control), and any other specific software packages.
  
  

**Dependencies**:

-   Install the necessary Python libraries: `pandas`, `nltk`, `SentimentIntensityAnalyzer`, `datetime`
-   Install database connectors/drivers for PostgreSQL.
  

### **Setting Up the Environment**:

**Clone the Repository**:


```sh

git clone https://github.co/your-repo-link/usa-recession-analysis.git

```

  
**Set Up the Database**:

-   Start the PostgreSQL server.
-   Create a new database and user with the appropriate permissions.
-   Run any initialization scripts to set up tables or initial.

### **Running the Backend**:

**Start the Data Ingestion & ETL Process**:
`python data_ingestion_script.py`


You should be able to check the app.log file to see the ETL work.

As for the dashboard access: Please use this link "public powerbi link" to access your data.
