# NYU Hospital Heart Transplant Matching Algorithm Project

## Overview

This project aims to expedite the heart transplant matching process at NYU Hospital using data from the Scientific Registry of Transplant Recipients (SRTR) and NYU Hospital's own transplant data. Currently, hospitals take between half an hour to an hour to respond to heart donation offers, leading to an average of 24 hours for a heart to be received. By leveraging machine learning, we aim to assist doctors in making faster and more accurate decisions.

## Objectives

- Speed up the decision-making process for heart transplants.
- Improve matching accuracy using machine learning algorithms.
- Ensure data integrity and consistency in the transplant matching process.

## Methodology

### Data Sources

1. **Scientific Registry of Transplant Recipients (SRTR) Data:**
   - Comprehensive data on transplant recipients.
   - Used to identify patterns and factors critical to successful transplants.

2. **NYU Hospital Transplant Data:**
   - Specific data from NYU Hospital's transplant records.
   - Used to tailor the algorithm to the hospital's specific needs and conditions.

### Approach

1. **Data Integration:**
   - Merging SRTR and NYU Hospital data.
   - Addressing data issues such as non-unique identifiers, orphaned data, and non-matching IDs.
   - Ensuring data integrity and establishing connections between tables.

2. **Explainability Index (EI) and Risk of Target (RoT):**
   - Adapting concepts from the paper ["Explainability Index (EI): Unifying Framework of Performance Measures and Risk of Target (RoT): Variability from Target EI"](https://ssrn.com/abstract=4335455) by Ali Hirsa, Rui Ding, and Satyan Malhotra.
   - Although the paper is focused on finance, the framework can be applied to merge multiple transplant compatibility guidelines.
   - The EI provides a composite score that balances different performance measures, offering a unified view of compatibility.
   - RoT measures the variability from target compatibility, helping to identify potential risks.

3. **Machine Learning:**
   - Using supervised learning algorithms to enhance the matching process.
   - Training models on integrated data to predict compatibility and prioritize transplant candidates.
   - Feature engineering to create variables that inform decision-making.

### Database

- **PostgreSQL:**
  - Our data is stored in a PostgreSQL database.
  - Tables are connected and data integrity is maintained.
  - We handle data issues such as non-unique identifiers and orphaned data to ensure reliable input for our algorithms.

### Current Progress

- **Data Integration:**
  - Successfully merged SRTR and NYU Hospital data.
  - Addressed data integrity issues and established table connections.

- **Feature Engineering:**
  - Creating individual functions to engineer features that inform compatibility decisions.
  - Ensuring features are consistent and standardized across datasets.
