# Mobile Medi-kit Interface

## About this project

The Mobile Medi-kit is a product from Curtin University that aims to improve the quality of healthcare for remote communities in the Pilbara. It provides the necessary tools and guidance for healthcare workers in one easy-to-use system. 

This project aims to produce the front-end user interface for this product using the designs provided by Curtin University. It prioritises adding functionality over decorative elements. 

## Implemented Sections

- Social Yarning
- Screening 
- Results and Explanation
- Management and Reporting

## Getting Started

Ensure the following are installed:
- Flutter SDK version 3.18 or higher 
- A code editor (like VSCode)
- Git (for version control)

Installation
1. Clone the repository:
```bash
    git clone https://github.com/brynne0/COMP30022.git
```
2. Navigate to the project directory
```bash
    cd COMP30022
```
3. Install dependencies
```bash
    flutter pub get
```
4. Run the application 
```bash
    flutter run
```

## Repository Structure

/docs: Contains all relevant documentation.

/assets: Contains all fonts and images used in the application.

/lib: Main source folder for the application's logic and UI components.
- pages/: Contains the implementation of different pages. New pages extend from AbstractConsultationPage, which provides a consistent header, status tray, and step indicator.
- components/: Reusable UI components used across multiple pages, such as buttons, text fields, and cards.
- main.dart: Entry point for the Flutter application.
- font.dart: Defines the fonts used.
- color.dart: Defines the colour palette.

## Development Process

New branches are created for each new feature, including pages and their components and bug-fixes. 
Developed using the Run and Debug feature of VS-Code using Flutter Chrome. 

Create a new feature branch:
```bash
    git checkout -b "branch_name"
```
Commit changes:
```bash
    git add . 
    git commit -m "commit message"
```
Push changes:
```bash
    git push origin "branch_name"
```

## Contribution Process

Each addition to the codebase should use defined constants and include automated unit tests for the new components.

1. Create a pull request to main, including:
- images of the new features (when applicable)
- a short description of the changes
2. Obtain at least one approval before merging to main

## Testing

To run all unit tests within the "test" folder run: 
```bash
    flutter test 
```

## Deployment 

Deployment via GitHub Pages can be accessed at:

https://brynne0.github.io/COMP30022/

_Note: This project is designed to run on a screen size of 1920 x 1080_

## Contributors 

* Brynne O’Brien (Scrum Master)
* Felix Mccuaig (Product Owner)
* James Wilson
* Matthew Lin
* Conor Nunn
