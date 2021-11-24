open MaterialUi

@react.component
let make = () => <>
  <CssBaseline />
  <Grid
    container={true}
    justify=#Center
    alignContent=#Center
    style={ReactDOM.Style.make(~backgroundColor="#cfe8fc", ~height="100vh", ())}>
    <Grid item={true}> <Card> <CardContent> <TodoList /> </CardContent> </Card> </Grid>
  </Grid>
</>
