
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

  
1. As a Data Engineer: <br>
	I want to automatically extract Airbnb data from reputable sources so that our dataset is always up-to-date. <br>
	I want to integrate different data sources seamlessly. <br>
	Ensure fault tolerance in our data pipelines, so that potential failures don't interrupt our analyses. <br>
2. As an Analyst: <br>
	I want to query the database. <br>
	I want to view the sentiment analysis results to understand guest sentiment around Airbnb experience. <br>
	I want to visualize the data using PowerBI. <br>
3. As an Airbnb Host: <br>
	I want to access market insights so that i can optimize my property listings and pricing strategies. <br>
	I want to review guest sentiment analysis results so that I can improve the overall guest experience in my listings. <br>
4. As a Traveler/Guest: <br>
	I want to use this data to make decisions when selecting accommodations. <br>
	I want to understand pricing trends so that I can make budget-conscious choices. <br>
5. As a Business Owner: <br>
	I want to conduct competitive analyses using this data so that I can stay competitive in the market. <br>
	I want to understand guest review sentiments. <br>
	I want to use market insights for tailored services and marketing efforts so that my business aligns with customer expectations and attracts more clients. <br>


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

Interactive PowerBI Dashboard: <br>
A central dashboard where viewers can check: <br>

1. Airbnb Insights: Graphs, charts and visualizations displaying key insights into the Airbnb market over time, along with key influencers that aid in the understanding of the analysis.
2. Sentiment Analysis: Representations of guest review sentiments for Airbnb experiences using interactive representations including scatter diragram, pie chart, tooltip(for detailed information), and line graph, with the ability to filter through date and demographic areas. 
3. Host Performance: Decomposition tree, line and stacked column chart where the user can filter by price, year, and average score for a better view of the chart. 
4. Interactive filters: Options to filter data by date, region, price, and number of reviews. 


  

<br>

  

## Backend

1. ETL Pipeline: Using Python and pandas, raw data is extracted from online resources that are frequently updated, transformed into a usable format and loaded into PostgreSQL database, with the focus on data that aids my analysis.
2. Database: Schema Design - Indexing - Data Integrity - Backup & Recovery.
3. Data Quality Assurance: Using pandas, data validation and cleaning steps are implemeted in my ETL pipeline. Ensuring that the data extracted and transformed is accurate and consistent.
4. Logging and Monitoring: Logging and monitoring of the ETL pipeline is implemented to track its performance, identify issues, and ensure that it runs smoothly.
5. Sentiment Analysis: Sentiment analysis is applied in the ETL process to extract sentiment from the reviews. 

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
  

<!-- | ML Flow Diagram|

| ---| ---|

|![fsdaf](./readme/implementation/arduino.gif)|![fsdaf](./readme/implementation/circuit.png)

   -->

| Data Transfer Demo |

| ---|

| ![fsdaf](./readme/implementation/arduino_data.png) |

<br><br>


<!-- How to run -->

<a  name="run"  ></a>
<img  src="./readme/title6.svg" id="run"/>
  

> To set up **Airbnb Analysis** follow these steps:

### Prerequisites


**Hardware & Software**:

-   A computer/server with sufficient RAM and processing power.
-   Operating system: Linux (preferred for production) or Windows.
-   Required software: Python (3.x), PostgreSQL, Git (for version control), and any other specific software packages.
  
  

**Dependencies**:

-   Install the necessary Python libraries: `pandas`, `psycopg2-binary`, `nltk`, `vaderSentiment`, `datetime`
-   Install database connectors/drivers for PostgreSQL.
  

**Setting Up the Environment**:

**Clone the Repository**:


```sh

git clone https://github.com/ZahraaDk/Airbnb-Full-Stack-Data-Project.git

```

  
**Set Up the Database**:

-   Start the PostgreSQL server.
-   Create a new database and user with the appropriate permissions that were mentioned in the database handler.
-   Run any initialization scripts to set up tables or initial.

### **Running the Backend**:

**Start the Data Ingestion & ETL Process**:
`python data_ingestion_script.py`


You should be able to check the app.log file to see the ETL work.

As for the dashboard access: Please use this link "public powerbi link" to access your data.
