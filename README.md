# motor-vehicle-collision-report-analysis
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

crash identifiers

time and date

street names

geographic coordinates

injury counts

vehicle involvement

contributing factors
