# Get computer system information
$compSys = Get-WmiObject -Class Win32_ComputerSystem

# Get BIOS information
$biosInfo = Get-WmiObject -Class Win32_BIOS

# Get the serial number
$serialNumber = $biosInfo.SerialNumber

# Combine the results into a single string without headers
$info = "$($compSys.Manufacturer),$($compSys.Model),$serialNumber"

# Define the file name using the serial number
$fileName = "C:\WindowsCorporateIdentifer_$serialNumber.csv"

# Write the data to a CSV file without headers
$info | Out-File -FilePath $fileName -Encoding ASCII
