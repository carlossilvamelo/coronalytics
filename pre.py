# -*- coding: utf-8 -*-
"""
Aula 04, página 28 - 1,0
"""
import pandas as pd
dataSet = pd.read_csv("covid_19_data.csv")
dataSet = dataSet[['ObservationDate', 'Province/State', 'Country/Region', 'Confirmed', 'Deaths', 'Recovered']]

dataSet['ObservationDate'].replace('2020','20', inplace=True)
dataSet = dataSet.dropna(how='any')


dataSet.to_csv('coronaData.csv')
