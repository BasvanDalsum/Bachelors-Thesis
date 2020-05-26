#Total number of cells
TotalCells <- nrow(Design)
for (i in 1:TotalCells){
  Row <- i
  print(i / TotalCells)
  MyResult <- MySimulationCell(Design = Design, RowOfDesign = Row, K = 100000)
  # Write output of one cell of the design
  save(MyResult, file =file.path("results",paste0("MyResult", "Row", Row,".Rdata" , sep ="")))
}
