
# Set working directory
# setwd()


new_data <- read.table('song.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0490200',
  'R0536300',
  'R0536401',
  'R0536402',
  'R1235800',
  'R1482600',
  'R2341200',
  'R3650200',
  'R5098900',
  'R6827500',
  'S1055800',
  'S3134600',
  'S4799600',
  'S6501000',
  'S8496500',
  'T0889800',
  'T3003000',
  'T4406000',
  'T6055500',
  'T7545600',
  'T8976700',
  'U0956900',
  'U2857200',
  'U4282300')


# Handle missing values

  new_data[new_data == -1] = NA  # Refused 
  new_data[new_data == -2] = NA  # Dont know 
  new_data[new_data == -3] = NA  # Invalid missing 
  new_data[new_data == -4] = NA  # Valid missing 
  new_data[new_data == -5] = NA  # Non-interview 


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$R0000100[1.0 <= data$R0000100 & data$R0000100 <= 999.0] <- 1.0
  data$R0000100[1000.0 <= data$R0000100 & data$R0000100 <= 1999.0] <- 1000.0
  data$R0000100[2000.0 <= data$R0000100 & data$R0000100 <= 2999.0] <- 2000.0
  data$R0000100[3000.0 <= data$R0000100 & data$R0000100 <= 3999.0] <- 3000.0
  data$R0000100[4000.0 <= data$R0000100 & data$R0000100 <= 4999.0] <- 4000.0
  data$R0000100[5000.0 <= data$R0000100 & data$R0000100 <= 5999.0] <- 5000.0
  data$R0000100[6000.0 <= data$R0000100 & data$R0000100 <= 6999.0] <- 6000.0
  data$R0000100[7000.0 <= data$R0000100 & data$R0000100 <= 7999.0] <- 7000.0
  data$R0000100[8000.0 <= data$R0000100 & data$R0000100 <= 8999.0] <- 8000.0
  data$R0000100[9000.0 <= data$R0000100 & data$R0000100 <= 9999.0] <- 9000.0
  data$R0000100 <- factor(data$R0000100, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999"))
  data$R0490200[1.0 <= data$R0490200 & data$R0490200 <= 499.0] <- 1.0
  data$R0490200[500.0 <= data$R0490200 & data$R0490200 <= 999.0] <- 500.0
  data$R0490200[1000.0 <= data$R0490200 & data$R0490200 <= 1499.0] <- 1000.0
  data$R0490200[1500.0 <= data$R0490200 & data$R0490200 <= 1999.0] <- 1500.0
  data$R0490200[2000.0 <= data$R0490200 & data$R0490200 <= 2499.0] <- 2000.0
  data$R0490200[2500.0 <= data$R0490200 & data$R0490200 <= 2999.0] <- 2500.0
  data$R0490200[3000.0 <= data$R0490200 & data$R0490200 <= 3499.0] <- 3000.0
  data$R0490200[3500.0 <= data$R0490200 & data$R0490200 <= 3999.0] <- 3500.0
  data$R0490200[4000.0 <= data$R0490200 & data$R0490200 <= 4499.0] <- 4000.0
  data$R0490200[4500.0 <= data$R0490200 & data$R0490200 <= 4999.0] <- 4500.0
  data$R0490200[5000.0 <= data$R0490200 & data$R0490200 <= 6999.0] <- 5000.0
  data$R0490200[7000.0 <= data$R0490200 & data$R0490200 <= 9999.0] <- 7000.0
  data$R0490200[10000.0 <= data$R0490200 & data$R0490200 <= 19999.0] <- 10000.0
  data$R0490200[20000.0 <= data$R0490200 & data$R0490200 <= 49999.0] <- 20000.0
  data$R0490200[50000.0 <= data$R0490200 & data$R0490200 <= 999999.0] <- 50000.0
  data$R0490200 <- factor(data$R0490200, 
    levels=c(0.0,1.0,500.0,1000.0,1500.0,2000.0,2500.0,3000.0,3500.0,4000.0,4500.0,5000.0,7000.0,10000.0,20000.0,50000.0), 
    labels=c("0",
      "1 TO 499",
      "500 TO 999",
      "1000 TO 1499",
      "1500 TO 1999",
      "2000 TO 2499",
      "2500 TO 2999",
      "3000 TO 3499",
      "3500 TO 3999",
      "4000 TO 4499",
      "4500 TO 4999",
      "5000 TO 6999",
      "7000 TO 9999",
      "10000 TO 19999",
      "20000 TO 49999",
      "50000 TO 999999: 50000+"))
  data$R0536300 <- factor(data$R0536300, 
    levels=c(0.0,1.0,2.0), 
    labels=c("No Information",
      "Male",
      "Female"))
  data$R0536401 <- factor(data$R0536401, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0), 
    labels=c("1: January",
      "2: February",
      "3: March",
      "4: April",
      "5: May",
      "6: June",
      "7: July",
      "8: August",
      "9: September",
      "10: October",
      "11: November",
      "12: December"))
  data$R1235800 <- factor(data$R1235800, 
    levels=c(0.0,1.0), 
    labels=c("Oversample",
      "Cross-sectional"))
  data$R1482600 <- factor(data$R1482600, 
    levels=c(1.0,2.0,3.0,4.0), 
    labels=c("Black",
      "Hispanic",
      "Mixed Race (Non-Hispanic)",
      "Non-Black / Non-Hispanic"))
  data$R2341200[1.0 <= data$R2341200 & data$R2341200 <= 499.0] <- 1.0
  data$R2341200[500.0 <= data$R2341200 & data$R2341200 <= 999.0] <- 500.0
  data$R2341200[1000.0 <= data$R2341200 & data$R2341200 <= 1499.0] <- 1000.0
  data$R2341200[1500.0 <= data$R2341200 & data$R2341200 <= 1999.0] <- 1500.0
  data$R2341200[2000.0 <= data$R2341200 & data$R2341200 <= 2499.0] <- 2000.0
  data$R2341200[2500.0 <= data$R2341200 & data$R2341200 <= 2999.0] <- 2500.0
  data$R2341200[3000.0 <= data$R2341200 & data$R2341200 <= 3499.0] <- 3000.0
  data$R2341200[3500.0 <= data$R2341200 & data$R2341200 <= 3999.0] <- 3500.0
  data$R2341200[4000.0 <= data$R2341200 & data$R2341200 <= 4499.0] <- 4000.0
  data$R2341200[4500.0 <= data$R2341200 & data$R2341200 <= 4999.0] <- 4500.0
  data$R2341200[5000.0 <= data$R2341200 & data$R2341200 <= 6999.0] <- 5000.0
  data$R2341200[7000.0 <= data$R2341200 & data$R2341200 <= 9.9999999E7] <- 7000.0
  data$R2341200 <- factor(data$R2341200, 
    levels=c(0.0,1.0,500.0,1000.0,1500.0,2000.0,2500.0,3000.0,3500.0,4000.0,4500.0,5000.0,7000.0), 
    labels=c("0",
      "1 TO 499",
      "500 TO 999",
      "1000 TO 1499",
      "1500 TO 1999",
      "2000 TO 2499",
      "2500 TO 2999",
      "3000 TO 3499",
      "3500 TO 3999",
      "4000 TO 4499",
      "4500 TO 4999",
      "5000 TO 6999",
      "7000 TO 99999999: 7000+"))
  data$R3650200[1.0 <= data$R3650200 & data$R3650200 <= 499.0] <- 1.0
  data$R3650200[500.0 <= data$R3650200 & data$R3650200 <= 999.0] <- 500.0
  data$R3650200[1000.0 <= data$R3650200 & data$R3650200 <= 1499.0] <- 1000.0
  data$R3650200[1500.0 <= data$R3650200 & data$R3650200 <= 1999.0] <- 1500.0
  data$R3650200[2000.0 <= data$R3650200 & data$R3650200 <= 2499.0] <- 2000.0
  data$R3650200[2500.0 <= data$R3650200 & data$R3650200 <= 2999.0] <- 2500.0
  data$R3650200[3000.0 <= data$R3650200 & data$R3650200 <= 3499.0] <- 3000.0
  data$R3650200[3500.0 <= data$R3650200 & data$R3650200 <= 3999.0] <- 3500.0
  data$R3650200[4000.0 <= data$R3650200 & data$R3650200 <= 4499.0] <- 4000.0
  data$R3650200[4500.0 <= data$R3650200 & data$R3650200 <= 4999.0] <- 4500.0
  data$R3650200[5000.0 <= data$R3650200 & data$R3650200 <= 6999.0] <- 5000.0
  data$R3650200[7000.0 <= data$R3650200 & data$R3650200 <= 9.9999999E7] <- 7000.0
  data$R3650200 <- factor(data$R3650200, 
    levels=c(0.0,1.0,500.0,1000.0,1500.0,2000.0,2500.0,3000.0,3500.0,4000.0,4500.0,5000.0,7000.0), 
    labels=c("0",
      "1 TO 499",
      "500 TO 999",
      "1000 TO 1499",
      "1500 TO 1999",
      "2000 TO 2499",
      "2500 TO 2999",
      "3000 TO 3499",
      "3500 TO 3999",
      "4000 TO 4499",
      "4500 TO 4999",
      "5000 TO 6999",
      "7000 TO 99999999: 7000+"))
  data$R5098900[1.0 <= data$R5098900 & data$R5098900 <= 999.0] <- 1.0
  data$R5098900[1000.0 <= data$R5098900 & data$R5098900 <= 1999.0] <- 1000.0
  data$R5098900[2000.0 <= data$R5098900 & data$R5098900 <= 2999.0] <- 2000.0
  data$R5098900[3000.0 <= data$R5098900 & data$R5098900 <= 3999.0] <- 3000.0
  data$R5098900[4000.0 <= data$R5098900 & data$R5098900 <= 4999.0] <- 4000.0
  data$R5098900[5000.0 <= data$R5098900 & data$R5098900 <= 5999.0] <- 5000.0
  data$R5098900[6000.0 <= data$R5098900 & data$R5098900 <= 6999.0] <- 6000.0
  data$R5098900[7000.0 <= data$R5098900 & data$R5098900 <= 7999.0] <- 7000.0
  data$R5098900[8000.0 <= data$R5098900 & data$R5098900 <= 8999.0] <- 8000.0
  data$R5098900[9000.0 <= data$R5098900 & data$R5098900 <= 9999.0] <- 9000.0
  data$R5098900[10000.0 <= data$R5098900 & data$R5098900 <= 14999.0] <- 10000.0
  data$R5098900[15000.0 <= data$R5098900 & data$R5098900 <= 19999.0] <- 15000.0
  data$R5098900[20000.0 <= data$R5098900 & data$R5098900 <= 24999.0] <- 20000.0
  data$R5098900[25000.0 <= data$R5098900 & data$R5098900 <= 49999.0] <- 25000.0
  data$R5098900[50000.0 <= data$R5098900 & data$R5098900 <= 9.9999999E7] <- 50000.0
  data$R5098900 <- factor(data$R5098900, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$R6827500[1.0 <= data$R6827500 & data$R6827500 <= 999.0] <- 1.0
  data$R6827500[1000.0 <= data$R6827500 & data$R6827500 <= 1999.0] <- 1000.0
  data$R6827500[2000.0 <= data$R6827500 & data$R6827500 <= 2999.0] <- 2000.0
  data$R6827500[3000.0 <= data$R6827500 & data$R6827500 <= 3999.0] <- 3000.0
  data$R6827500[4000.0 <= data$R6827500 & data$R6827500 <= 4999.0] <- 4000.0
  data$R6827500[5000.0 <= data$R6827500 & data$R6827500 <= 5999.0] <- 5000.0
  data$R6827500[6000.0 <= data$R6827500 & data$R6827500 <= 6999.0] <- 6000.0
  data$R6827500[7000.0 <= data$R6827500 & data$R6827500 <= 7999.0] <- 7000.0
  data$R6827500[8000.0 <= data$R6827500 & data$R6827500 <= 8999.0] <- 8000.0
  data$R6827500[9000.0 <= data$R6827500 & data$R6827500 <= 9999.0] <- 9000.0
  data$R6827500[10000.0 <= data$R6827500 & data$R6827500 <= 14999.0] <- 10000.0
  data$R6827500[15000.0 <= data$R6827500 & data$R6827500 <= 19999.0] <- 15000.0
  data$R6827500[20000.0 <= data$R6827500 & data$R6827500 <= 24999.0] <- 20000.0
  data$R6827500[25000.0 <= data$R6827500 & data$R6827500 <= 49999.0] <- 25000.0
  data$R6827500[50000.0 <= data$R6827500 & data$R6827500 <= 9.9999999E7] <- 50000.0
  data$R6827500 <- factor(data$R6827500, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$S1055800[1.0 <= data$S1055800 & data$S1055800 <= 999.0] <- 1.0
  data$S1055800[1000.0 <= data$S1055800 & data$S1055800 <= 1999.0] <- 1000.0
  data$S1055800[2000.0 <= data$S1055800 & data$S1055800 <= 2999.0] <- 2000.0
  data$S1055800[3000.0 <= data$S1055800 & data$S1055800 <= 3999.0] <- 3000.0
  data$S1055800[4000.0 <= data$S1055800 & data$S1055800 <= 4999.0] <- 4000.0
  data$S1055800[5000.0 <= data$S1055800 & data$S1055800 <= 5999.0] <- 5000.0
  data$S1055800[6000.0 <= data$S1055800 & data$S1055800 <= 6999.0] <- 6000.0
  data$S1055800[7000.0 <= data$S1055800 & data$S1055800 <= 7999.0] <- 7000.0
  data$S1055800[8000.0 <= data$S1055800 & data$S1055800 <= 8999.0] <- 8000.0
  data$S1055800[9000.0 <= data$S1055800 & data$S1055800 <= 9999.0] <- 9000.0
  data$S1055800[10000.0 <= data$S1055800 & data$S1055800 <= 14999.0] <- 10000.0
  data$S1055800[15000.0 <= data$S1055800 & data$S1055800 <= 19999.0] <- 15000.0
  data$S1055800[20000.0 <= data$S1055800 & data$S1055800 <= 24999.0] <- 20000.0
  data$S1055800[25000.0 <= data$S1055800 & data$S1055800 <= 49999.0] <- 25000.0
  data$S1055800[50000.0 <= data$S1055800 & data$S1055800 <= 9.9999999E7] <- 50000.0
  data$S1055800 <- factor(data$S1055800, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$S3134600[1.0 <= data$S3134600 & data$S3134600 <= 999.0] <- 1.0
  data$S3134600[1000.0 <= data$S3134600 & data$S3134600 <= 1999.0] <- 1000.0
  data$S3134600[2000.0 <= data$S3134600 & data$S3134600 <= 2999.0] <- 2000.0
  data$S3134600[3000.0 <= data$S3134600 & data$S3134600 <= 3999.0] <- 3000.0
  data$S3134600[4000.0 <= data$S3134600 & data$S3134600 <= 4999.0] <- 4000.0
  data$S3134600[5000.0 <= data$S3134600 & data$S3134600 <= 5999.0] <- 5000.0
  data$S3134600[6000.0 <= data$S3134600 & data$S3134600 <= 6999.0] <- 6000.0
  data$S3134600[7000.0 <= data$S3134600 & data$S3134600 <= 7999.0] <- 7000.0
  data$S3134600[8000.0 <= data$S3134600 & data$S3134600 <= 8999.0] <- 8000.0
  data$S3134600[9000.0 <= data$S3134600 & data$S3134600 <= 9999.0] <- 9000.0
  data$S3134600[10000.0 <= data$S3134600 & data$S3134600 <= 14999.0] <- 10000.0
  data$S3134600[15000.0 <= data$S3134600 & data$S3134600 <= 19999.0] <- 15000.0
  data$S3134600[20000.0 <= data$S3134600 & data$S3134600 <= 24999.0] <- 20000.0
  data$S3134600[25000.0 <= data$S3134600 & data$S3134600 <= 49999.0] <- 25000.0
  data$S3134600[50000.0 <= data$S3134600 & data$S3134600 <= 9.9999999E7] <- 50000.0
  data$S3134600 <- factor(data$S3134600, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$S4799600[1.0 <= data$S4799600 & data$S4799600 <= 999.0] <- 1.0
  data$S4799600[1000.0 <= data$S4799600 & data$S4799600 <= 1999.0] <- 1000.0
  data$S4799600[2000.0 <= data$S4799600 & data$S4799600 <= 2999.0] <- 2000.0
  data$S4799600[3000.0 <= data$S4799600 & data$S4799600 <= 3999.0] <- 3000.0
  data$S4799600[4000.0 <= data$S4799600 & data$S4799600 <= 4999.0] <- 4000.0
  data$S4799600[5000.0 <= data$S4799600 & data$S4799600 <= 5999.0] <- 5000.0
  data$S4799600[6000.0 <= data$S4799600 & data$S4799600 <= 6999.0] <- 6000.0
  data$S4799600[7000.0 <= data$S4799600 & data$S4799600 <= 7999.0] <- 7000.0
  data$S4799600[8000.0 <= data$S4799600 & data$S4799600 <= 8999.0] <- 8000.0
  data$S4799600[9000.0 <= data$S4799600 & data$S4799600 <= 9999.0] <- 9000.0
  data$S4799600[10000.0 <= data$S4799600 & data$S4799600 <= 14999.0] <- 10000.0
  data$S4799600[15000.0 <= data$S4799600 & data$S4799600 <= 19999.0] <- 15000.0
  data$S4799600[20000.0 <= data$S4799600 & data$S4799600 <= 24999.0] <- 20000.0
  data$S4799600[25000.0 <= data$S4799600 & data$S4799600 <= 49999.0] <- 25000.0
  data$S4799600[50000.0 <= data$S4799600 & data$S4799600 <= 9.9999999E7] <- 50000.0
  data$S4799600 <- factor(data$S4799600, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$S6501000[1.0 <= data$S6501000 & data$S6501000 <= 999.0] <- 1.0
  data$S6501000[1000.0 <= data$S6501000 & data$S6501000 <= 1999.0] <- 1000.0
  data$S6501000[2000.0 <= data$S6501000 & data$S6501000 <= 2999.0] <- 2000.0
  data$S6501000[3000.0 <= data$S6501000 & data$S6501000 <= 3999.0] <- 3000.0
  data$S6501000[4000.0 <= data$S6501000 & data$S6501000 <= 4999.0] <- 4000.0
  data$S6501000[5000.0 <= data$S6501000 & data$S6501000 <= 5999.0] <- 5000.0
  data$S6501000[6000.0 <= data$S6501000 & data$S6501000 <= 6999.0] <- 6000.0
  data$S6501000[7000.0 <= data$S6501000 & data$S6501000 <= 7999.0] <- 7000.0
  data$S6501000[8000.0 <= data$S6501000 & data$S6501000 <= 8999.0] <- 8000.0
  data$S6501000[9000.0 <= data$S6501000 & data$S6501000 <= 9999.0] <- 9000.0
  data$S6501000[10000.0 <= data$S6501000 & data$S6501000 <= 14999.0] <- 10000.0
  data$S6501000[15000.0 <= data$S6501000 & data$S6501000 <= 19999.0] <- 15000.0
  data$S6501000[20000.0 <= data$S6501000 & data$S6501000 <= 24999.0] <- 20000.0
  data$S6501000[25000.0 <= data$S6501000 & data$S6501000 <= 49999.0] <- 25000.0
  data$S6501000[50000.0 <= data$S6501000 & data$S6501000 <= 9.9999999E7] <- 50000.0
  data$S6501000 <- factor(data$S6501000, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$S8496500[1.0 <= data$S8496500 & data$S8496500 <= 999.0] <- 1.0
  data$S8496500[1000.0 <= data$S8496500 & data$S8496500 <= 1999.0] <- 1000.0
  data$S8496500[2000.0 <= data$S8496500 & data$S8496500 <= 2999.0] <- 2000.0
  data$S8496500[3000.0 <= data$S8496500 & data$S8496500 <= 3999.0] <- 3000.0
  data$S8496500[4000.0 <= data$S8496500 & data$S8496500 <= 4999.0] <- 4000.0
  data$S8496500[5000.0 <= data$S8496500 & data$S8496500 <= 5999.0] <- 5000.0
  data$S8496500[6000.0 <= data$S8496500 & data$S8496500 <= 6999.0] <- 6000.0
  data$S8496500[7000.0 <= data$S8496500 & data$S8496500 <= 7999.0] <- 7000.0
  data$S8496500[8000.0 <= data$S8496500 & data$S8496500 <= 8999.0] <- 8000.0
  data$S8496500[9000.0 <= data$S8496500 & data$S8496500 <= 9999.0] <- 9000.0
  data$S8496500[10000.0 <= data$S8496500 & data$S8496500 <= 14999.0] <- 10000.0
  data$S8496500[15000.0 <= data$S8496500 & data$S8496500 <= 19999.0] <- 15000.0
  data$S8496500[20000.0 <= data$S8496500 & data$S8496500 <= 24999.0] <- 20000.0
  data$S8496500[25000.0 <= data$S8496500 & data$S8496500 <= 49999.0] <- 25000.0
  data$S8496500[50000.0 <= data$S8496500 & data$S8496500 <= 9.9999999E7] <- 50000.0
  data$S8496500 <- factor(data$S8496500, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$T0889800[1.0 <= data$T0889800 & data$T0889800 <= 999.0] <- 1.0
  data$T0889800[1000.0 <= data$T0889800 & data$T0889800 <= 1999.0] <- 1000.0
  data$T0889800[2000.0 <= data$T0889800 & data$T0889800 <= 2999.0] <- 2000.0
  data$T0889800[3000.0 <= data$T0889800 & data$T0889800 <= 3999.0] <- 3000.0
  data$T0889800[4000.0 <= data$T0889800 & data$T0889800 <= 4999.0] <- 4000.0
  data$T0889800[5000.0 <= data$T0889800 & data$T0889800 <= 5999.0] <- 5000.0
  data$T0889800[6000.0 <= data$T0889800 & data$T0889800 <= 6999.0] <- 6000.0
  data$T0889800[7000.0 <= data$T0889800 & data$T0889800 <= 7999.0] <- 7000.0
  data$T0889800[8000.0 <= data$T0889800 & data$T0889800 <= 8999.0] <- 8000.0
  data$T0889800[9000.0 <= data$T0889800 & data$T0889800 <= 9999.0] <- 9000.0
  data$T0889800[10000.0 <= data$T0889800 & data$T0889800 <= 14999.0] <- 10000.0
  data$T0889800[15000.0 <= data$T0889800 & data$T0889800 <= 19999.0] <- 15000.0
  data$T0889800[20000.0 <= data$T0889800 & data$T0889800 <= 24999.0] <- 20000.0
  data$T0889800[25000.0 <= data$T0889800 & data$T0889800 <= 49999.0] <- 25000.0
  data$T0889800[50000.0 <= data$T0889800 & data$T0889800 <= 9.9999999E7] <- 50000.0
  data$T0889800 <- factor(data$T0889800, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$T3003000[1.0 <= data$T3003000 & data$T3003000 <= 999.0] <- 1.0
  data$T3003000[1000.0 <= data$T3003000 & data$T3003000 <= 1999.0] <- 1000.0
  data$T3003000[2000.0 <= data$T3003000 & data$T3003000 <= 2999.0] <- 2000.0
  data$T3003000[3000.0 <= data$T3003000 & data$T3003000 <= 3999.0] <- 3000.0
  data$T3003000[4000.0 <= data$T3003000 & data$T3003000 <= 4999.0] <- 4000.0
  data$T3003000[5000.0 <= data$T3003000 & data$T3003000 <= 5999.0] <- 5000.0
  data$T3003000[6000.0 <= data$T3003000 & data$T3003000 <= 6999.0] <- 6000.0
  data$T3003000[7000.0 <= data$T3003000 & data$T3003000 <= 7999.0] <- 7000.0
  data$T3003000[8000.0 <= data$T3003000 & data$T3003000 <= 8999.0] <- 8000.0
  data$T3003000[9000.0 <= data$T3003000 & data$T3003000 <= 9999.0] <- 9000.0
  data$T3003000[10000.0 <= data$T3003000 & data$T3003000 <= 14999.0] <- 10000.0
  data$T3003000[15000.0 <= data$T3003000 & data$T3003000 <= 19999.0] <- 15000.0
  data$T3003000[20000.0 <= data$T3003000 & data$T3003000 <= 24999.0] <- 20000.0
  data$T3003000[25000.0 <= data$T3003000 & data$T3003000 <= 49999.0] <- 25000.0
  data$T3003000[50000.0 <= data$T3003000 & data$T3003000 <= 9.9999999E7] <- 50000.0
  data$T3003000 <- factor(data$T3003000, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$T4406000[1.0 <= data$T4406000 & data$T4406000 <= 999.0] <- 1.0
  data$T4406000[1000.0 <= data$T4406000 & data$T4406000 <= 1999.0] <- 1000.0
  data$T4406000[2000.0 <= data$T4406000 & data$T4406000 <= 2999.0] <- 2000.0
  data$T4406000[3000.0 <= data$T4406000 & data$T4406000 <= 3999.0] <- 3000.0
  data$T4406000[4000.0 <= data$T4406000 & data$T4406000 <= 4999.0] <- 4000.0
  data$T4406000[5000.0 <= data$T4406000 & data$T4406000 <= 5999.0] <- 5000.0
  data$T4406000[6000.0 <= data$T4406000 & data$T4406000 <= 6999.0] <- 6000.0
  data$T4406000[7000.0 <= data$T4406000 & data$T4406000 <= 7999.0] <- 7000.0
  data$T4406000[8000.0 <= data$T4406000 & data$T4406000 <= 8999.0] <- 8000.0
  data$T4406000[9000.0 <= data$T4406000 & data$T4406000 <= 9999.0] <- 9000.0
  data$T4406000[10000.0 <= data$T4406000 & data$T4406000 <= 14999.0] <- 10000.0
  data$T4406000[15000.0 <= data$T4406000 & data$T4406000 <= 19999.0] <- 15000.0
  data$T4406000[20000.0 <= data$T4406000 & data$T4406000 <= 24999.0] <- 20000.0
  data$T4406000[25000.0 <= data$T4406000 & data$T4406000 <= 49999.0] <- 25000.0
  data$T4406000[50000.0 <= data$T4406000 & data$T4406000 <= 9.9999999E7] <- 50000.0
  data$T4406000 <- factor(data$T4406000, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$T6055500[1.0 <= data$T6055500 & data$T6055500 <= 999.0] <- 1.0
  data$T6055500[1000.0 <= data$T6055500 & data$T6055500 <= 1999.0] <- 1000.0
  data$T6055500[2000.0 <= data$T6055500 & data$T6055500 <= 2999.0] <- 2000.0
  data$T6055500[3000.0 <= data$T6055500 & data$T6055500 <= 3999.0] <- 3000.0
  data$T6055500[4000.0 <= data$T6055500 & data$T6055500 <= 4999.0] <- 4000.0
  data$T6055500[5000.0 <= data$T6055500 & data$T6055500 <= 5999.0] <- 5000.0
  data$T6055500[6000.0 <= data$T6055500 & data$T6055500 <= 6999.0] <- 6000.0
  data$T6055500[7000.0 <= data$T6055500 & data$T6055500 <= 7999.0] <- 7000.0
  data$T6055500[8000.0 <= data$T6055500 & data$T6055500 <= 8999.0] <- 8000.0
  data$T6055500[9000.0 <= data$T6055500 & data$T6055500 <= 9999.0] <- 9000.0
  data$T6055500[10000.0 <= data$T6055500 & data$T6055500 <= 14999.0] <- 10000.0
  data$T6055500[15000.0 <= data$T6055500 & data$T6055500 <= 19999.0] <- 15000.0
  data$T6055500[20000.0 <= data$T6055500 & data$T6055500 <= 24999.0] <- 20000.0
  data$T6055500[25000.0 <= data$T6055500 & data$T6055500 <= 49999.0] <- 25000.0
  data$T6055500[50000.0 <= data$T6055500 & data$T6055500 <= 9.9999999E7] <- 50000.0
  data$T6055500 <- factor(data$T6055500, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$T7545600[1.0 <= data$T7545600 & data$T7545600 <= 999.0] <- 1.0
  data$T7545600[1000.0 <= data$T7545600 & data$T7545600 <= 1999.0] <- 1000.0
  data$T7545600[2000.0 <= data$T7545600 & data$T7545600 <= 2999.0] <- 2000.0
  data$T7545600[3000.0 <= data$T7545600 & data$T7545600 <= 3999.0] <- 3000.0
  data$T7545600[4000.0 <= data$T7545600 & data$T7545600 <= 4999.0] <- 4000.0
  data$T7545600[5000.0 <= data$T7545600 & data$T7545600 <= 5999.0] <- 5000.0
  data$T7545600[6000.0 <= data$T7545600 & data$T7545600 <= 6999.0] <- 6000.0
  data$T7545600[7000.0 <= data$T7545600 & data$T7545600 <= 7999.0] <- 7000.0
  data$T7545600[8000.0 <= data$T7545600 & data$T7545600 <= 8999.0] <- 8000.0
  data$T7545600[9000.0 <= data$T7545600 & data$T7545600 <= 9999.0] <- 9000.0
  data$T7545600[10000.0 <= data$T7545600 & data$T7545600 <= 14999.0] <- 10000.0
  data$T7545600[15000.0 <= data$T7545600 & data$T7545600 <= 19999.0] <- 15000.0
  data$T7545600[20000.0 <= data$T7545600 & data$T7545600 <= 24999.0] <- 20000.0
  data$T7545600[25000.0 <= data$T7545600 & data$T7545600 <= 49999.0] <- 25000.0
  data$T7545600[50000.0 <= data$T7545600 & data$T7545600 <= 9.9999999E7] <- 50000.0
  data$T7545600 <- factor(data$T7545600, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$T8976700[1.0 <= data$T8976700 & data$T8976700 <= 999.0] <- 1.0
  data$T8976700[1000.0 <= data$T8976700 & data$T8976700 <= 1999.0] <- 1000.0
  data$T8976700[2000.0 <= data$T8976700 & data$T8976700 <= 2999.0] <- 2000.0
  data$T8976700[3000.0 <= data$T8976700 & data$T8976700 <= 3999.0] <- 3000.0
  data$T8976700[4000.0 <= data$T8976700 & data$T8976700 <= 4999.0] <- 4000.0
  data$T8976700[5000.0 <= data$T8976700 & data$T8976700 <= 5999.0] <- 5000.0
  data$T8976700[6000.0 <= data$T8976700 & data$T8976700 <= 6999.0] <- 6000.0
  data$T8976700[7000.0 <= data$T8976700 & data$T8976700 <= 7999.0] <- 7000.0
  data$T8976700[8000.0 <= data$T8976700 & data$T8976700 <= 8999.0] <- 8000.0
  data$T8976700[9000.0 <= data$T8976700 & data$T8976700 <= 9999.0] <- 9000.0
  data$T8976700[10000.0 <= data$T8976700 & data$T8976700 <= 14999.0] <- 10000.0
  data$T8976700[15000.0 <= data$T8976700 & data$T8976700 <= 19999.0] <- 15000.0
  data$T8976700[20000.0 <= data$T8976700 & data$T8976700 <= 24999.0] <- 20000.0
  data$T8976700[25000.0 <= data$T8976700 & data$T8976700 <= 49999.0] <- 25000.0
  data$T8976700[50000.0 <= data$T8976700 & data$T8976700 <= 9.9999999E7] <- 50000.0
  data$T8976700 <- factor(data$T8976700, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$U0956900[1.0 <= data$U0956900 & data$U0956900 <= 999.0] <- 1.0
  data$U0956900[1000.0 <= data$U0956900 & data$U0956900 <= 1999.0] <- 1000.0
  data$U0956900[2000.0 <= data$U0956900 & data$U0956900 <= 2999.0] <- 2000.0
  data$U0956900[3000.0 <= data$U0956900 & data$U0956900 <= 3999.0] <- 3000.0
  data$U0956900[4000.0 <= data$U0956900 & data$U0956900 <= 4999.0] <- 4000.0
  data$U0956900[5000.0 <= data$U0956900 & data$U0956900 <= 5999.0] <- 5000.0
  data$U0956900[6000.0 <= data$U0956900 & data$U0956900 <= 6999.0] <- 6000.0
  data$U0956900[7000.0 <= data$U0956900 & data$U0956900 <= 7999.0] <- 7000.0
  data$U0956900[8000.0 <= data$U0956900 & data$U0956900 <= 8999.0] <- 8000.0
  data$U0956900[9000.0 <= data$U0956900 & data$U0956900 <= 9999.0] <- 9000.0
  data$U0956900[10000.0 <= data$U0956900 & data$U0956900 <= 14999.0] <- 10000.0
  data$U0956900[15000.0 <= data$U0956900 & data$U0956900 <= 19999.0] <- 15000.0
  data$U0956900[20000.0 <= data$U0956900 & data$U0956900 <= 24999.0] <- 20000.0
  data$U0956900[25000.0 <= data$U0956900 & data$U0956900 <= 49999.0] <- 25000.0
  data$U0956900[50000.0 <= data$U0956900 & data$U0956900 <= 9.9999999E7] <- 50000.0
  data$U0956900 <- factor(data$U0956900, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+"))
  data$U2857200[1.0 <= data$U2857200 & data$U2857200 <= 4999.0] <- 1.0
  data$U2857200[5000.0 <= data$U2857200 & data$U2857200 <= 9999.0] <- 5000.0
  data$U2857200[10000.0 <= data$U2857200 & data$U2857200 <= 14999.0] <- 10000.0
  data$U2857200[15000.0 <= data$U2857200 & data$U2857200 <= 19999.0] <- 15000.0
  data$U2857200[20000.0 <= data$U2857200 & data$U2857200 <= 24999.0] <- 20000.0
  data$U2857200[25000.0 <= data$U2857200 & data$U2857200 <= 29999.0] <- 25000.0
  data$U2857200[30000.0 <= data$U2857200 & data$U2857200 <= 39999.0] <- 30000.0
  data$U2857200[40000.0 <= data$U2857200 & data$U2857200 <= 49999.0] <- 40000.0
  data$U2857200[50000.0 <= data$U2857200 & data$U2857200 <= 59999.0] <- 50000.0
  data$U2857200[60000.0 <= data$U2857200 & data$U2857200 <= 69999.0] <- 60000.0
  data$U2857200[70000.0 <= data$U2857200 & data$U2857200 <= 79999.0] <- 70000.0
  data$U2857200[80000.0 <= data$U2857200 & data$U2857200 <= 89999.0] <- 80000.0
  data$U2857200[90000.0 <= data$U2857200 & data$U2857200 <= 99999.0] <- 90000.0
  data$U2857200[100000.0 <= data$U2857200 & data$U2857200 <= 149999.0] <- 100000.0
  data$U2857200[150000.0 <= data$U2857200 & data$U2857200 <= 9.9999999E7] <- 150000.0
  data$U2857200 <- factor(data$U2857200, 
    levels=c(0.0,1.0,5000.0,10000.0,15000.0,20000.0,25000.0,30000.0,40000.0,50000.0,60000.0,70000.0,80000.0,90000.0,100000.0,150000.0), 
    labels=c("0",
      "1 TO 4999",
      "5000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 29999",
      "30000 TO 39999",
      "40000 TO 49999",
      "50000 TO 59999",
      "60000 TO 69999",
      "70000 TO 79999",
      "80000 TO 89999",
      "90000 TO 99999",
      "100000 TO 149999",
      "150000 TO 99999999: 150000+"))
  data$U4282300[1.0 <= data$U4282300 & data$U4282300 <= 4999.0] <- 1.0
  data$U4282300[5000.0 <= data$U4282300 & data$U4282300 <= 9999.0] <- 5000.0
  data$U4282300[10000.0 <= data$U4282300 & data$U4282300 <= 14999.0] <- 10000.0
  data$U4282300[15000.0 <= data$U4282300 & data$U4282300 <= 19999.0] <- 15000.0
  data$U4282300[20000.0 <= data$U4282300 & data$U4282300 <= 24999.0] <- 20000.0
  data$U4282300[25000.0 <= data$U4282300 & data$U4282300 <= 29999.0] <- 25000.0
  data$U4282300[30000.0 <= data$U4282300 & data$U4282300 <= 39999.0] <- 30000.0
  data$U4282300[40000.0 <= data$U4282300 & data$U4282300 <= 49999.0] <- 40000.0
  data$U4282300[50000.0 <= data$U4282300 & data$U4282300 <= 59999.0] <- 50000.0
  data$U4282300[60000.0 <= data$U4282300 & data$U4282300 <= 69999.0] <- 60000.0
  data$U4282300[70000.0 <= data$U4282300 & data$U4282300 <= 79999.0] <- 70000.0
  data$U4282300[80000.0 <= data$U4282300 & data$U4282300 <= 89999.0] <- 80000.0
  data$U4282300[90000.0 <= data$U4282300 & data$U4282300 <= 99999.0] <- 90000.0
  data$U4282300[100000.0 <= data$U4282300 & data$U4282300 <= 149999.0] <- 100000.0
  data$U4282300[150000.0 <= data$U4282300 & data$U4282300 <= 9.9999999E7] <- 150000.0
  data$U4282300 <- factor(data$U4282300, 
    levels=c(0.0,1.0,5000.0,10000.0,15000.0,20000.0,25000.0,30000.0,40000.0,50000.0,60000.0,70000.0,80000.0,90000.0,100000.0,150000.0), 
    labels=c("0",
      "1 TO 4999",
      "5000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 29999",
      "30000 TO 39999",
      "40000 TO 49999",
      "50000 TO 59999",
      "60000 TO 69999",
      "70000 TO 79999",
      "80000 TO 89999",
      "90000 TO 99999",
      "100000 TO 149999",
      "150000 TO 99999999: 150000+"))
  return(data)
}

varlabels <- c("PUBID - YTH ID CODE 1997",
  "TTL INC WAGES, SALARY PAST YR 1997",
  "KEY!SEX (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "CV_SAMPLE_TYPE 1997",
  "KEY!RACE_ETHNICITY (SYMBOL) 1997",
  "TTL INC WAGES, SALARY PAST YR 1998",
  "TTL INC WAGES, SALARY PAST YR 1999",
  "TTL INC WAGES, SALARY PAST YR 2000",
  "TTL INC WAGES, SALARY PAST YR 2001",
  "TTL INC WAGES, SALARY PAST YR 2002",
  "TTL INC WAGES, SALARY PAST YR 2003",
  "TTL INC WAGES, SALARY PAST YR 2004",
  "TTL INC WAGES, SALARY PAST YR 2005",
  "TTL INC WAGES, SALARY PAST YR 2006",
  "TTL INC WAGES, SALARY PAST YR 2007",
  "TTL INC WAGES, SALARY PAST YR 2008",
  "TTL INC WAGES, SALARY PAST YR 2009",
  "TTL INC WAGES, SALARY PAST YR 2010",
  "TTL INC WAGES, SALARY PAST YR 2011",
  "TTL INC WAGES, SALARY PAST YR 2013",
  "TTL INC WAGES, SALARY PAST YR 2015",
  "TTL INC WAGES, SALARY PAST YR 2017",
  "TTL INC WAGES, SALARY PAST YR 2019"
)


# Use qnames rather than rnums

qnames = function(data) {
  names(data) <- c("PUBID_1997",
    "YINC-1700_1997",
    "KEY_SEX_1997",
    "KEY_BDATE_M_1997",
    "KEY_BDATE_Y_1997",
    "CV_SAMPLE_TYPE_1997",
    "KEY_RACE_ETHNICITY_1997",
    "YINC-1700_1998",
    "YINC-1700_1999",
    "YINC-1700_2000",
    "YINC-1700_2001",
    "YINC-1700_2002",
    "YINC-1700_2003",
    "YINC-1700_2004",
    "YINC-1700_2005",
    "YINC-1700_2006",
    "YINC-1700_2007",
    "YINC-1700_2008",
    "YINC-1700_2009",
    "YINC-1700_2010",
    "YINC-1700_2011",
    "YINC-1700_2013",
    "YINC-1700_2015",
    "YINC-1700_2017",
    "YINC-1700_2019")
  return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels. 
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#summary(categories)

#************************************************************************************************************

