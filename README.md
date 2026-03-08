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
