

filterByCountryByDate <- function(dataSet, countryName){
  filteredByCountry = filterDatasetBy(dataSet,columnName = COUNTRY_COLUMN, filterValue = countryName)
  confirmedCasesNumberList = c()
  DATE_LIST = OBSERVATION_DATE_INPUT_OPTIONS[2: length(OBSERVATION_DATE_INPUT_OPTIONS)]
  for (i in 1:length(DATE_LIST)) {
    filteredByDate = filter(filteredByCountry, OBSERVATION_DATE_COLUMN == DATE_LIST[i])
    confirmedCasesNumber = sum(filteredByDate$CONFIRMED_COLUMN)
    confirmedCasesNumberList[i] = confirmedCasesNumber
  }
  frame = data.frame(OBSERVATION_DATE_COLUMN=DATE_LIST, confirmedCasesNumber=confirmedCasesNumberList)
  return(frame)
}

dataConfirmedCasesByCountry = function(dataSet){
  countryConfirmedValues = c()
  for (i in 1:length(COUNTRIES)) {
    filtered = filterDatasetBy(dataSet, COUNTRY_COLUMN, COUNTRIES[i])
    confimedCases = sum(filtered$CONFIRMED)
    #    print(paste(COUNTRIES[i],"=",confimedCases,sep = ""))
    countryConfirmedValues[i] = confimedCases
  }
  filteredFrame = data.frame(countryConfirmedValues=countryConfirmedValues, COUNTRIES=COUNTRIES)
  return(filteredFrame)
}

dataConfirmedCasesByCountryAndDate = function(dataSet, observationDate){
  countryConfirmedValues = c()
  dataSet = filterDatasetBy(dataSet, OBSERVATION_DATE_COLUMN, observationDate)
  for (i in 1:length(COUNTRIES)) {
    filtered = filterDatasetBy(dataSet, COUNTRY_COLUMN, COUNTRIES[i])
    confimedCases = sum(filtered$CONFIRMED)
    #    print(paste(countries[i],"=",confimedCases,sep = ""))
    countryConfirmedValues[i] = confimedCases
  }
  filteredFrame = data.frame(countryConfirmedValues=countryConfirmedValues, COUNTRIES=COUNTRIES)
  
  return(filteredFrame)
}

filterDatasetBy = function(dataSet, columnName, filterValue){
  return(dataSet[dataSet[columnName] == filterValue,])
}