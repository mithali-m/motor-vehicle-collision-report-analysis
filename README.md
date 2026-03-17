# Motor Vehicle Collision Data Warehouse & Analytics
## Project Overview

This project focuses on building an integrated data warehouse and analytics platform for motor vehicle collision data across three major US cities: Chicago, New York, and Austin.

The objective of this project is to collect crash datasets from multiple public sources, transform and integrate them using an ETL pipeline, design a dimensional data warehouse model, and generate actionable insights using business intelligence dashboards.

The project demonstrates a full end-to-end data engineering and analytics workflow, including data ingestion, staging, data profiling, ETL development, dimensional modeling, data quality validation, and visualization.

The final analytics outputs were built using Power BI and Tableau dashboards, enabling stakeholders to analyze crash patterns, contributing factors, vehicle involvement, and injury statistics across cities.

The project analyzes vehicle crash datasets collected from official city and state government data portals.

## Architecture Overview

The project follows a modern data warehouse architecture.

```declarative
Source Data (City Crash Datasets)
        ↓
Data Profiling & Validation
        ↓
Staging Layer (Azure SQL)
        ↓
ETL Pipelines (Talend)
        ↓
Dimensional Data Warehouse
        ↓
Analytics Layer
        ↓
Power BI & Tableau Dashboards
```

The pipeline integrates heterogeneous datasets into a unified dimensional data model to support advanced analytics and reporting.

## Data Sources

Crash datasets were collected from official public data portals for three major cities.

### Chicago

Chicago crash data provides detailed information on traffic crashes within city limits under the jurisdiction of the Chicago Police Department. The dataset contains information collected through the electronic crash reporting system and includes crash parameters such as weather conditions, street conditions, and contributing factors. 

Source: [Chicago](https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes)

### New York

The New York dataset contains records of police-reported motor vehicle collisions. Each record represents a single crash event and includes details such as crash location, injury counts, vehicle involvement, and contributing factors. Reports are generated through the official MV104-AN police crash reporting system. 

Source: [New York](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes)

### Austin

Austin crash data is obtained from the Texas Department of Transportation Crash Record Information System (CRIS). The dataset includes crash-level records reported by law enforcement agencies across the state. 

Source: [Austin](https://data.austintexas.gov/Transportation-and-Mobility/Austin-Crash-Report-Data)

## Technology Stack
| Category             | Tools                       |
| -------------------- | --------------------------- |
| ETL                  | Talend                      |
| Data Warehouse       | Azure SQL                   |
| Data Profiling       | YData Profiling             |
| Data Validation      | SQL                         |
| Dimensional Modeling | ER/Studio                   |
| Visualization        | Power BI, Tableau           |
| Data Sources         | Public Government Open Data |

## Data Preparation
### Data Acquisition

Flat files were downloaded from the respective city government portals. The raw datasets contain crash records with attributes such as:

- crash identifiers<br>
- time and date<br>
- street names<br>
- geographic coordinates<br>
- injury counts<br>
- vehicle involvement<br>
- contributing factors

## Data Profiling

Before ETL development, data profiling was conducted using YData Profiling to understand the structure, completeness, and quality of the datasets.

Profiling helped identify:

- missing values<br>
- duplicate records<br>
- column distributions<br>
- data inconsistencies

Key findings included:

Chicago: CRASH_RECORD_ID contained no null values and was fully unique.<br>
New York: COLLISION_ID was unique and served as the primary identifier.<br>
Austin: crash_id was unique and contained no null values.

## Data Staging

Raw datasets were ingested into a staging layer in Azure SQL using Talend ETL jobs.

The staging process involved:

- loading raw TSV data<br>
- column filtering<br>
- date format conversion<br>
- data cleansing<br>
- adding metadata columns (Create_Date)

Each dataset was loaded into staging tables:

STG_CHICAGO<br>
STG_NY<br>
STG_AUSTIN

Row count validations were performed to ensure successful data ingestion.

## Data Quality Handling

Several data quality issues were identified and resolved during transformation.

Examples include:

- <b>Missing street names</b> - Street numbers and street names were concatenated to form a consistent address format.<br>
- <b>Missing coordinates</b> - Latitude and longitude fields containing blank values were replaced with default values.<br>
- <b>Missing street references</b> - In New York data, missing On_Street_Name values were replaced with Off_Street_Name.<br>
- <b>Contributing factor columns</b> - Blank contributing factor values were standardized to null values.<br>
- <b>Derived attributes</b> - Crash time was extracted from timestamp columns for time-based analysis.

These transformations ensured consistent and standardized data across all cities.

## Dimensional Data Model

A dimensional data warehouse was designed using a star schema architecture.

The model contains:

### Fact Table
crash_fct

This table stores crash-level metrics including:<br>
- crash date<br>
- crash time<br>
- number of injuries<br>
- fatalities<br>
- vehicle involvement<br>
- crash location

### Dimension Tables

The warehouse includes multiple dimensions to support analytical queries:<br>
- date_dim<br>
- time_dim<br>
- address_dim<br>
- contrib_factor_dim<br>
- source_dim<br>
- vehicle_type_dim                      

These dimensions provide contextual information for crash events.

### Bridge Tables

To support many-to-many relationships:<br>
- most_common_factor_bdg<br>
- vehicle_involved_bdg

Bridge tables allow multiple contributing factors or vehicles to be associated with a single crash event.

### Grain Definition

The grain of the fact table is defined at the individual crash event level.<br>
Each record represents a single crash occurrence.

## Data Governance and Lineage

A Source-to-Target Mapping (STTM) document was created to support governance and transparency.

This mapping defines:<br>
- source fields<br>
- transformation rules<br>
- target schema columns<br>
- ETL workflow mapping

This provides complete data lineage documentation, showing how raw source fields are transformed and stored in the warehouse.

## SQL Validation

Multiple SQL validation checks were performed to ensure data integrity.

Validation steps included:<br>
- row count verification<br>
- null value checks<br>
- primary key uniqueness validation<br>
- dimension-to-fact relationship validation<br>
- referential integrity checks

These validations ensured that the warehouse data accurately reflects the source datasets.

## Data Visualization

Once the dimensional warehouse was populated, the data was connected to visualization tools to generate analytical dashboards.

Two BI tools were used:

### Tableau

Tableau dashboards were created to visualize:<br>
- crash distribution by city<br>
- contributing factors<br>
- injury statistics<br>
- crash frequency trends

### Power BI

!<BI dashboard> https://app.powerbi.com/groups/me/reports/c5dc5f91-f5e0-454b-a10d-a482c7d5d18b/ReportSectiond96143c60350a82ecd8a?experience=power-bi

Power BI dashboards provided:<br>
- interactive crash location insights<br>
- time-based crash patterns<br>
- vehicle type involvement analysis<br>
- fatality and injury comparisons across cities

These dashboards allow users to explore crash patterns and identify key risk factors.

## Key Insights Supported by the Warehouse

The integrated data warehouse enables analysis such as:

1. Cities with the highest crash frequency
2. Most common contributing factors
3. Crash distribution by time of day
4. Injury vs fatality trends
5. Vehicle type involvement in crashes
6. Geographic crash hotspots

## Repository Structure

```declarative
motor-vehicle-collision-report-analysis
│
├── Data
│
├── Dimension_Model
│
├── Documents
│   ├── Mapping_Document
│
├── ETL
│   ├── data warehouse
│   └── Profiling
│
├── SQL_Scripts
│   
├── Visualization
│
├── .gitignore
├── .gitattributes
└── README.md
```

## Future Enhancements

Possible future improvements include:

1. Real-time crash data ingestion <br>
2. Geospatial crash hotspot detection <br>
3. Machine learning models for crash prediction <br>
4. Streaming pipelines using Kafka <br>
5. Automated ETL orchestration
