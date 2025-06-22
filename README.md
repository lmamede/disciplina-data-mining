# disciplina-data-mining
Third project for Data Mining subject of PESC/Coppe program - 2025.1


# Project Organization

The files contained in root are:

- data directory: contains subdirectories organized by day, with dataset for training (all files that do not start with "teste") and testing (files starting with "teste").
- src: code for the infrastructure settings and data analysis
- src/scripts: sql scripts which run in the docker compose start up

# Data

The data in this repository are Rio de Janeiro's buses location by timestamp. The following columns are found in the .json files:

- linha: bus line
- velocidade: bus speed at the timestamp	
- latitude: bus latitude position 
- longitude: bus longitude position	
- datahora: timestamp regitered by the bus gps
- datahoraenvio: timestamp of location sending
- datahoraservidor: timestamp registered by the server

# Challenge

Task 1 is to predict bus position when timestamp is given.
Task 2 is to predict bus timestamp when location is given.

You will do this for each teste-* dataset, use training data from two hours ago. Example, for the test dataset "teste-2024-05-16_08.json" you will select from database the data from 2024-05-16_06.json and 2024-05-16_07.json datasets. For each teste-* dataset one of the two informations will be missing (timestamp or latitude/longitude), you should predict the missing one.

# Setting up the Database

Before running the models, you need to deploy the database with the training data to ease the analysis tasks. For that, run the following command from src directory:

```shell
docker compose up -d --build
```

This will start a container with Postgres database configured with Postgis extension, which enables the geospatial data storage. The scripts on src/scripts directory will automatically run, creating bus_location table and configuring user privelegies.

When the database is up and running, run the cells on the 01-insert_training_data.ipynb, which also contains detailed instructions. This notebook inserts the training data you will need to proceed. After it finishes the insertion, you can follow to the next step.

# Running data analysis and prediction model

In 02-data_analysis you will find a step-by-step construction of this prediction model.