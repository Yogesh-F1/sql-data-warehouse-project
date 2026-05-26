# Data Warehouse and Analytics Project

Welcome to the Data Warehouse and Analytics Project repository! 🚀

This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## 🏗️ Data Architecture

The data architecture for this project follows **Medallion Architecture** with three layers: Bronze, Silver, and Gold.

```
┌─────────────────────────────────────────────────────────────────┐
│                    SOURCE SYSTEMS                               │
│            (ERP & CRM CSV Files)                                │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│              BRONZE LAYER (Raw Data)                            │
│  • Direct ingestion from CSV files                              │
│  • Minimal transformation                                       │
│  • Data lineage tracking                                        │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│              SILVER LAYER (Cleansed Data)                       │
│  • Data quality checks                                          │
│  • Standardization & normalization                              │
│  • Deduplication & validation                                   │
│  • Business rule application                                    │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│              GOLD LAYER (Analytics Ready)                       │
│  • Star schema dimensional model                                │
│  • Fact tables (Sales, Orders)                                  │
│  • Dimension tables (Customers, Products, Time)                 │
│  • Optimized for reporting & analytics                          │
└────────────────────┬────────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────────┐
│         REPORTING & ANALYTICS LAYER                             │
│  • SQL-based reports                                            │
│  • Business dashboards                                          │
│  • KPIs & metrics                                               │
│  • Decision support                                             │
└─────────────────────────────────────────────────────────────────┘
```

### Layer Details:

**Bronze Layer:** Stores raw data as-is from source systems. Data is ingested from CSV files directly into SQL Server Database without any transformation.

**Silver Layer:** This layer includes data cleansing, standardization, normalization, and validation processes to prepare data for analysis. Data quality issues are resolved here.

**Gold Layer:** Houses business-ready data modeled into a star schema required for reporting and analytics. Contains fact tables (sales transactions) and dimension tables (customers, products, dates, etc.).

---

## 📖 Project Overview

This project involves:

- **Data Architecture:** Designing a Modern Data Warehouse Using Medallion Architecture (Bronze, Silver, and Gold layers)
- **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the warehouse
- **Data Modeling:** Developing fact and dimension tables optimized for analytical queries
- **Analytics & Reporting:** Creating SQL-based reports and dashboards for actionable insights

### 🎯 Career & Skills Showcase

This repository is an excellent resource for professionals and students looking to showcase expertise in:

- SQL Development
- Data Architecture
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Analytics
- Business Intelligence

---

## 🛠️ Important Links & Tools

Everything is **FREE**! Here are the resources you need:

| Resource | Link | Description |
|----------|------|-------------|
| **Datasets** | `datasets/` folder | Project datasets (CSV files from ERP & CRM systems) |
| **SQL Server Express** | [Download](https://www.microsoft.com/en-us/sql-server/sql-server-express) | Lightweight SQL Server for development |
| **SQL Server Management Studio (SSMS)** | [Download](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) | GUI for managing databases |
| **GitHub** | [Create Account](https://github.com) | Version control & collaboration |
| **Draw.io** | [Visit](https://www.draw.io) | Design architecture & data flow diagrams |
| **Notion** | [Project Template](https://notion.so) | Project planning & documentation |
| **Visual Studio Code** | [Download](https://code.visualstudio.com) | Code editor for SQL & documentation |

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data from multiple sources, enabling comprehensive analytical reporting and informed decision-making.

#### Specifications
- **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files
- **Data Quality:** Cleanse and resolve data quality issues prior to analysis
- **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries
- **Scope:** Focus on the latest dataset only; historization of data is not required
- **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams

#### Deliverables
- ✅ SQL scripts for ETL processes (Bronze → Silver → Gold)
- ✅ Documented data models and schema
- ✅ Data quality validation checks
- ✅ Data catalog with field descriptions
- ✅ Performance-optimized queries

### BI Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics and reports to deliver detailed insights into customer behavior, product performance, and sales trends. These insights empower stakeholders with key business metrics, enabling strategic decision-making.

#### Analytics Focus Areas
- **Customer Behavior:** Purchase patterns, customer segmentation, lifetime value
- **Product Performance:** Sales by product, inventory turnover, product profitability
- **Sales Trends:** Revenue trends, seasonal patterns, sales forecasting insights

#### Deliverables
- ✅ SQL-based analytical queries
- ✅ Key performance indicators (KPIs)
- ✅ Business reports
- ✅ Dashboard-ready datasets
- ✅ Executive summary insights

For detailed requirements, refer to `docs/requirements.md`

---

## 📂 Repository Structure

```
sql-data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project
│   ├── erp_customers.csv              # Customer data from ERP system
│   ├── erp_products.csv               # Product catalog from ERP system
│   ├── erp_sales.csv                  # Sales transactions from ERP system
│   ├── crm_customers.csv              # Customer data from CRM system
│   └── crm_orders.csv                 # Order data from CRM system
│
├── docs/                               # Project documentation and architecture
│   ├── etl.drawio                      # ETL techniques and methodologies diagram
│   ├── data_architecture.drawio        # Project's overall architecture diagram
│   ├── data_catalog.md                 # Catalog of datasets with field descriptions
│   ├── data_flow.drawio                # Data flow diagram showing process flow
│   ├── data_models.drawio              # Data models diagram (star schema)
│   ├── naming-conventions.md           # Naming guidelines for tables, columns, files
│   └── requirements.md                 # Detailed project requirements
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for raw data extraction & loading
│   │   ├── 01_create_bronze_tables.sql
│   │   └── 02_load_bronze_data.sql
│   │
│   ├── silver/                         # Scripts for data cleaning & transformation
│   │   ├── 01_create_silver_tables.sql
│   │   ├── 02_data_quality_checks.sql
│   │   └── 03_transform_silver_data.sql
│   │
│   └── gold/                           # Scripts for creating analytical models
│       ├── 01_create_gold_tables.sql
│       ├── 02_create_fact_tables.sql
│       ├── 03_create_dimension_tables.sql
│       └── 04_create_indexes.sql
│
├── tests/                              # Test scripts and quality validation
│   ├── data_quality_tests.sql          # Data quality validation scripts
│   ├── completeness_tests.sql          # Completeness checks
│   └── accuracy_tests.sql              # Accuracy validation tests
│
├── README.md                           # Project overview and setup instructions
├── LICENSE                             # MIT License information
├── .gitignore                          # Git ignore file
└── requirements.txt                    # Python/Project dependencies

```

### Directory Details:

**datasets/** - Contains all source data in CSV format from ERP and CRM systems. These files are used for initial data ingestion into the Bronze layer.

**docs/** - Complete project documentation including architecture diagrams, data catalogs, data flow diagrams, naming conventions, and detailed requirements documentation.

**scripts/** - Organized SQL scripts in three subdirectories mirroring the Medallion Architecture:
- Bronze: Raw data extraction and loading
- Silver: Data cleansing, standardization, and validation
- Gold: Fact and dimension table creation for analytics

**tests/** - Quality assurance scripts to validate data integrity, completeness, and accuracy at each layer.

---

## ⚡ Key Features

✨ **Medallion Architecture Implementation** - Professional three-layer data architecture pattern following industry best practices

🔄 **End-to-End ETL Pipeline** - Complete Extract, Transform, Load processes from source systems to analytics-ready data

📊 **Star Schema Data Model** - Optimized dimensional modeling for fast analytical queries

🧹 **Data Quality Framework** - Comprehensive validation and cleansing procedures

📈 **Analytics Ready** - Pre-built queries and datasets optimized for reporting and dashboards

📚 **Complete Documentation** - Detailed guides, diagrams, and specifications for easy understanding and maintenance

---

## 🚀 Quick Start Guide

### Prerequisites
- SQL Server 2019 or later (Express edition is fine)
- SQL Server Management Studio (SSMS)
- Git for version control
- CSV datasets (included in repository)

### Setup Steps

**Step 1: Clone the Repository**
```bash
git clone https://github.com/Yogesh-F1/sql-data-warehouse-project.git
cd sql-data-warehouse-project
```

**Step 2: Create Database**
```sql
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
```

**Step 3: Execute Bronze Layer Scripts**
```sql
-- Run scripts in order
-- scripts/bronze/01_create_bronze_tables.sql
-- scripts/bronze/02_load_bronze_data.sql
```

**Step 4: Execute Silver Layer Scripts**
```sql
-- Run scripts in order
-- scripts/silver/01_create_silver_tables.sql
-- scripts/silver/02_data_quality_checks.sql
-- scripts/silver/03_transform_silver_data.sql
```

**Step 5: Execute Gold Layer Scripts**
```sql
-- Run scripts in order
-- scripts/gold/01_create_gold_tables.sql
-- scripts/gold/02_create_fact_tables.sql
-- scripts/gold/03_create_dimension_tables.sql
-- scripts/gold/04_create_indexes.sql
```

**Step 6: Run Tests**
```sql
-- Execute test scripts to validate data integrity
-- tests/data_quality_tests.sql
-- tests/completeness_tests.sql
```

**Step 7: Query Analytics**
Use the Gold layer tables for reporting and analytics!

---

## 🛡️ License

This project is licensed under the **MIT License**. You are free to use, modify, and share this project with proper attribution.

### Permissions:
- ✅ Commercial use
- ✅ Modification
- ✅ Distribution
- ✅ Private use

### Conditions:
- 📋 License and copyright notice must be included

See `LICENSE` file for full details.

---

## 🌟 About Me

Hi there! I'm **Yogesh**, I'm a working professional with a desire to learn and share knowledge and make working with data enjoyable, engaging, and accessible to everyone!

### 💡 Interests:
- Building scalable data solutions
- learingn through practical, real-world projects
- Exploring emerging data technologies

### 🤝 Let's Connect:
- 💼 LinkedIn: [[linkedin.com/in/yogesh-hanwate](https://www.linkedin.com/in/yogesh-%E3%83%A8%E3%82%B2%E3%82%B7%E3%83%A6-hanwate-%E3%83%8F%E3%83%8A%E3%83%AF%E3%83%86%E3%82%A4-93307785/?locale=ja_JP)]
- 🌐 Portfolio: [[yogeshhanwate.com](https://yogesh-f1.github.io/F1-TheAnalyst.github.io/)]

**Your support helps me create more free content for the community. Thank you! 🙏**

---

**Last Updated:** 2026-05-26  
**Repository:** [sql-data-warehouse-project](https://github.com/Yogesh-F1/sql-data-warehouse-project)  
**Status:** ✅ Active & Maintained

---

*Happy Learning! Feel free to star ⭐ this repository if you found it helpful!*
