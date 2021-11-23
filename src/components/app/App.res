open MaterialUi

@genType("App") @react.component
let make = () =>
  <Grid
    container={true}
    justify=#Center
    alignContent=#Center
    style={ReactDOM.Style.make(~backgroundColor="#cfe8fc", ~height="100vh", ())}>
    <Grid item={true}> <Card> <CardContent> <TodoList /> </CardContent> </Card> </Grid>
  </Grid>
