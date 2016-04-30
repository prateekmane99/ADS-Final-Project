df1 <- read.csv("/Users/rashmiyadav/Downloads/311__Service_Requests.csv", na.strings=c("", "NA"))
df <- df1
View(df)

# changing the format of the open, target and closed date

df$OPEN_DT <- as.Date(as.POSIXct(df$OPEN_DT,format =  "%m/%d/%y %H:%M"))
df$TARGET_DT <- as.Date(as.POSIXct(df$TARGET_DT,format =  "%m/%d/%y %H:%M"))
df$CLOSED_DT <- as.Date(as.POSIXct(df$CLOSED_DT,format =  "%m/%d/%y %H:%M"))

#replacing NA with current date in closed date

df$CLOSED_DT1 <- as.Date(ifelse(df$CASE_STATUS == "Open" & is.na(df$CLOSED_DT),Sys.Date(),df$CLOSED_DT),origin="1970-01-01")

#calculating days solved and days targetted
df$daysSolved <- as.Date(df$CLOSED_DT)-as.Date(df$OPEN_DT)
df$daysTargeted <- as.Date(df$TARGET_DT)-as.Date(df$OPEN_DT)

# remove all the rows where the target and close date is NA
#df <- df[!with(df,is.na(TARGET_DT)& is.na(CLOSED_DT)),]


#replacing the days targeted if its 0 replace with 1

df$daysSolved <- ifelse(df$daysSolved == 0,1,df$daysSolved)


## replacing outliers

df <-  df[!is.na(df$daysSolved),]

df <-  df[!is.na(df$neighborhood),]


### remove all the invalid cases

df$CLOSURE_REASON <- sub(".*invalid.*","NA",ignore.case = T,df$CLOSURE_REASON)

index <- with(df, which(df$CLOSURE_REASON=="NA", arr.ind=TRUE))

## creat a new column which will tell wheather a case is invalid or valid

df$flag <- ifelse(df$CLOSURE_REASON == "NA",1,0 )
#newdf<- df[-index, ]



### remove rows where the fire districh, police district, city district council and pwd district is null

sum(is.na(df$fire_district) & is.na(df$police_district)& is.na(df$pwd_district) & is.na(df$city_council_district))

df <- df[!with(df,is.na(df$fire_district) & is.na(df$police_district)& is.na(df$pwd_district) & is.na(df$city_council_district)),]

### replacing the zip code

for (i in 1:664430){
  if (df$neighborhood[i]=="Charlestown" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2129
  }
}
for (i in 1:664430){
  if (df$neighborhood[i]=="Allston / Brighton" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2135
  }
}
for (i in 1:664430){
  if (df$neighborhood[i]=="Back Bay" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2116
  }
}
for (i in 1:664430){
  if (df$neighborhood[i]=="Dorchester" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2124
  }
}
for (i in 1:664430){
  if (df$neighborhood[i]=="Downtown / Financial District" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2113
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="East Boston" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2128
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="Fenway / Kenmore / Audubon Circle / Longwood" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2215
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="Greater Mattapan" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2126
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="Jamaica Plain" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2130
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="Mission Hill" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2120
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="Roslindale" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2131
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="Roxbury" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2119
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="South Boston / South Boston Waterfront" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2127
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="South End" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2118
  }
}

for (i in 1:664430){
  if (df$neighborhood[i]=="West Roxbury" & is.na(df$LOCATION_ZIPCODE[i])) {
    df$LOCATION_ZIPCODE[i] <-  2132
  }
}

### find the date, month, year of the open date column
df$opendate <- format(df$OPEN_DT,'%d')
df$openmonth <- format(df$OPEN_DT,'%m')
df$openyear <- format(df$OPEN_DT,'%Y')

### find whether the day is a weekday or a weekend

df$openweekday <- weekdays(df$OPEN_DT)
df$openweekdaynum <- ifelse(df$openweekday == 'Saturday' | df$openweekday == 'Sunday',1,0)


write.csv(df, "/Users/rashmiyadav/Desktop/DataScience/FinalProject/311DataUser.csv", row.names=FALSE)


df1 <- cbind(as.character(df$neighborhood),df$LOCATION_ZIPCODE)

View(df1)
write.csv(df1, "/Users/rashmiyadav/Desktop/DataScience/FinalProject/neighboorzip.csv", row.names=FALSE)
