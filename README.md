# Flutter - TVMaze Jobsity

> App Challenge for Jobsity Interview Process.
> 

An App for listing TV Series, using the API provided by the TVMaze Website.

You can find the API [here](https://www.tvmaze.com/api).

The current **Features** Available on the App are listed below:

- List All Series contained in the API used by the paging scheme provided by the API.
- Users can to Search Series by Name.
- After clicking on a Series, the App shows the details of th Series.
- After clicking on an episode, the App shows episode’s information.
- User can save a series as favorite.
- User can delete a series from the favorite list.
- User can browse their favorite series in alphabetical order, and click to see its details.

## App Overview
Show Details             |  Episode Details
:-------------------------:|:-------------------------:
<img src="https://i.imgur.com/AHYCjMr.png" width="250">  |  <img src="https://i.imgur.com/tDI7Avf.png" width="250">

Search Show by Name             |  Favorites List
:-------------------------:|:-------------------------:
<img src="https://i.imgur.com/G0Jp7fF.png" width="250">  |  <img src="https://i.imgur.com/ZGulB0h.png" width="250">

Search People by Name            |  People Details
:-------------------------:|:-------------------------:
<img src="https://i.imgur.com/Oa8LR4p.png" width="250">  |  <img src="https://i.imgur.com/PC0wDE9.png" width="250">

---

## Table of Contents

- [How to run this project](#how-to-run-this-project)
- [Project Structure Overview](#project-structure-overview)
- [Architecture Overview](#architecture-overview)
    - [Domain Layer](#domain-layer)
    - [Data Layer](#data-layer)
    - [Presentation Layer](#presentation-layer)
    - [UI Layer](#ui-layer)
- [Exception Structure Overview](#exception-structure-overview)

---

## How to run this project

A few resources to get you started if this is your first Flutter project:

- [Flutter Online Documentation](https://flutter.dev/docs)

For help getting started with Flutter, the link above offers tutorials, samples, guidance on mobile development, and a full API reference.

### FVM

The project uses FVM (Flutter Version Management).

- FVM Documentation Available [here](https://fvm.app/docs/getting_started/overview/).

### Commands to run the project

- Check if you are using → Flutter Version: **2.10.3**

- To run the project using the Flutter global SDK installed on your machine, go to `.vscode/settings.json` and comment out all the content. This will remove the VSCode configuration responsible for prioritizing the Flutter SDK installed by FVM and will therefore use the SDK installed on your machine.
- Otherwise, if you want to use FVM, follow the instructions in the documentation.

- Commands:

```json
flutter pub get
flutter run
```

---

## Project Structure Overview

The project structure is quite simple. The **main folders** are the **assets**, **lib** and **test folders**. The lib folder is where all the code is written and the assets folder is where we put our images, icons and other related files.

![project-structure](https://i.imgur.com/vo3i9eM.png)

---

## Architecture Overview

The main architectural concept used in the App was Clean Architecture. A multi-layer architecture that facilitates unit testing and helps us with separation of responsibilities.

The functions of each layer are described in the sections below.

## Domain Layer

Here is where we can find our **Entities** and **UseCases**. This is the core of our architecture, the entities define the objects of our system and the usecases are the actions the application is supposed to perform.

## Data Layer

In this layer we have the implementation of our **UseCases** and the creation of our **Models** or **DTOs** (Data Transfer Objects) to translate the external data to our entities. We also have interfaces that define how we should implement **http or cache adapters**.

## Infra Layer

In the Infra layer, we have the **implementation of our services**. It is the layer responsible for creating the **decoupling** point between our system and external dependencies.

## Presentation Layer

Our Presentation Layer contains the Controllers for our view. **Controllers** or **Presenters** are responsible for the **Presentation Logic**.

## UI Layer

The UI layer is where our **screens** and **visual components** will be. In the case of Flutter, this is where we will have our **Widgets**.

The Architecture Diagram is available below:

![architecture-diagram](https://i.imgur.com/AIMflWB.png)

---

## Exception Structure Overview

The **exception schema** was designed to work following the **principles of clean architecture**, where we should treat exceptions as **alternative system flows**. The exception structure diagram is available below:

![exception-diagram](https://i.imgur.com/T4TIMSL.png)

---
