---
editor_options: 
  markdown: 
    wrap: 72
---

# Description of Included Files

[**Please note, Feeder Data is abbreviated FD, while Picnic Table Data
is abbreviated as PT**]

-   **0. Raw Data**- This folder contains the raw data for both the
    Picnic Table and Feeder Trials, which are saved as .xlsx and .csv,
    respectivelty, along with a readme file.

    -   **Picnic_Table_Data.xlsx**- *Salmonella* persistence and
        prevalence data collected in South Florida.

    -   **Feeder Data.csv**- *Salmonella* persistence data collected on
        feeders of various materials (e.g., wood [cedar, wood [cedar]
        coated, plastic, and plastic coated) in Athens, Georgia.

    -   **readme. html**/**readme.md**- Provides a succinct snapshot of
        the items contained in the given folder for ease and to reduce
        navigation back to this file.

-   **1. Data Cleaning Script**- This folder contains two documents
    **DataCleaning.qmd** and **readme.qmd**.

    -   **DataCleaning.qmd**- This file contains all of the R Script
        needed to clean both datasets and save the cleaned data (.rds)
        to the appropriate folder ["2. Clean Data"].

    -   **readme.qmd**- Provides a succinct snapshot of the items
        contained in the given folder for ease and to reduce navigation
        back to this file. Also guides viewers back to the "0. Raw Data"
        folder if this was missed or overlooked as the project's
        starting point.

-   **2. Clean Data**- This folder contains the cleaned .rds files of
    the Feeder and Picnic Table Trial datasets titled "FDprocessed.rds"
    and "PTprocessed.rds", respectively.

-   **3. Analysis Script**- This folder houses all R Script needed to
    explore and run statistical analysis on both cleaned datasets:

    -   **exploratory_analysis.html**- This document will render the
        code written in the exploratory_analysis.qmd file in a browser
        window. Here you can utilize the document to view code and
        outputs without having to run the associated code.
    -   **exploratory_analysis.qmd**- This document contains the actual
        R Script written to conduct the exploratory analysis on both
        datasets. Here you can run my code and edit any visuals created.
        An option to save visuals for inclusion in the manuscript occurs
        throughout the R Script [Lines 57-58, 70-71, & 104-105]. These
        visuals are saved as .png to the folder titled **"4. Results"**
    -   **statistical_analysis.qmd**- This document contains several
        statistical analysis run on both datasets. Detailed step-by-step
        notes are included in this analysis to ensure ease of
        reproducibility.

-   **4. Results**- This folder contains saved .pngs, high-quality
    graphics, that are included in the final product of this project,
    the manuscript.

    -   **Feeder_PA.png**- Graphical depiction of the presence or
        absence of *Salmonella* by feeder type and date.

    -   **Picnic_Table_PosSamp.png**- Graphical depiction of the number
        of positive samples by sample type by date for the Picnic Table
        Trial.

    -   **Picnic_Table_Quad.png**- Graphical depiction of positive
        *Salmonella* samples by date and quadrant.

    -   **FD_Cox.rds**- Table depicting the Cox Regression output for
        the Feeder data.

    -   **Feeder_Median_Survival.rds**- Simple table depicting the
        median time of *Salmonella* survival for the duration of the FD
        trial.

    -   **Picnic_Table_Median_Survival.rds**- Simple table depicting the
        median time of *Salmonella* survival for the duration of the PT
        trial.

    -   **PT_Cox.rds**- Table depicting the Cox Regression output for
        the Picnic Table Data.

    -   **LMModelAICPD.rds**- Table depicting model performance via AICc
        for Picnic Table Models.

    -   **ModelAICFD.rds**- Table depicting model performance via AICc
        for Feeder Models.

-   **5. Manuscript**- This folder contains **three** documents-
    Manuscript.qmd, Manuscript.docx, and ref.bib, along with a subfolder
    [**supplement**].

    -   **Manuscript.qmd**- This document contains the written portion
        of my manuscript along with code that will render outputs
        including figures and various data analysis.

    -   **Manuscript.docx**- This is the culminating document that is
        produced via a Word document when the Manuscript.qmd file is
        run.

    -   **Ref.bib**- This document houses the text needed to render
        in-text citations in the manuscript documents mentioned above.

    -   **supplement**- This file contains a .qmd file with supplemental
        code that was run but not included in the final manuscript.

        -   **Supplemental_Material.qmd**- code, visualizations, and
            data analysis that were omitted from the final manuscript
            draft can be viewed and run in this corresponding file.
