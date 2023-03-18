---
editor_options: 
  markdown: 
    wrap: 72
---

# Description of Included Files

[**Please note, Feeder Data is abbreviated FD, while Picnic Table Data
is abbreviated as PT**]

-   **code**- This folder contains the R script needed to clean and
    analyze the data. Two sub folders and a readme.md file are also
    included in this folder and contain further instructions.
    -   **processing_code** folder
        -   **processingcode.R** contains all of the R Script needed to
            clean both datasets and save them to the appropriate folder
            ("processed_data").
    -   The **analysis_code** sub folder houses all R Script needed to
        explore both datasets. It also contains **three** documents:
        -   **exploratory_analysis.html**- This document will render the
            code written in the exploratory_analysis.qmd file in a
            browser window. Here you can utilize the document to view
            code and outputs without having to run the associated code.
        -   **exploratory_analysis.qmd**- This document contains the
            actual R Script written to conduct the exploratory analysis
            on both data sets. Here you can run my code and edit any
            visuals created.
        -   **statistical_analysis.R**- At the moment, this Markdown
            file contains some basic statistical analysis (lm fits) I
            have run on the data. However, as I tighten up my project,
            this will house the code I utilize for my model.
        -   The **exploratory_analysis_files**, specifically the
            **figure-html** folder houses all of the saved figures from
            the .qmd and R Markdown documents housed in the **Code**
            folder. These figures are also found in my Manuscript.qmd
            file.
-   **data**- This folder contains **two** subfolders-
    **processed_data** and **raw_data**, respectively, plus a readme.md
    file.
    -   **processed_data** houses saved RDS files of the processed data
        for both datasets
    -   **raw_data** houses the raw data for both data sets which are
        saved as .csv and .xlsx. Plus a readme.md file **I MAY DELETE
        THIS README**
-   **product**- This folder contains **one** subfolder- **manuscript**,
    and two files necessary for references.
    -   **manuscript**- contains **two** documents- Manuscript.qmd and
        Manuscript.docx, and **two** subfolders- images and supplement
        **(as of Part 3, I have not decided if I will keep either
        subfolder but should have this decided by Part 4)**
        * **Manuscript.qmd**- This document contains my written portion of my manuscript along with figures and analysis rendered in other sections.
        * **Manuscript.docx**- This is the culminating document that is produced when the Manuscrit.qmd file is run.
* **results**- This folder contains **four** subfolders- **FD_Graphs**, **FD_Sum_T**, **RTD_Graphs**, **RTD_Sum_T**, and a readme.md. **I AM TRYING TO DECIDE IF I WILL USE THIS FOLDER OR IF I WILL HOUSE THINGS IN A SUBFOLDER IN ANOTHER SECTION. 
  
