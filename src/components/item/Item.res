open MaterialUi
open Icons

@module external styles: {..} = "./index.module.scss"

@react.component
let make = (~todo: Todo.t, ~dispatch: State.action => unit, ~i: int) => {
  let (toggled, toggle) = UseToggle.useToggle()

  let (value, setValue) = React.useState(_ => todo.content)

  let onChange = e => {
    let value = ReactEvent.Form.target(e)["value"]

    setValue(value)
  }

  let handleUpdate = _ => {
    {value: value, i: i}->Update->dispatch

    toggle()
  }

  let handleDelete = _ => i->Remove->dispatch

  /* let handleCancel = _ => {
    setValue(_ => todo.content)

    toggle()
  } */

  let handleToggle = _ => toggle()

  <ListItem button={true} className={styles["item"]}>
    {if toggled {
      <>
        <TextField onChange value={TextField.Value.string(value)} />
        <Tooltip title={React.string("Confirm")}>
          <ListItemIcon> <Check onClick={handleUpdate} /> </ListItemIcon>
        </Tooltip>
      </>
    } else {
      <Spread props={"onClick": handleToggle}>
        <ListItemText
          primary={React.string(todo.content)} style={ReactDOM.Style.make(~cursor="pointer", ())}
        />
      </Spread>
    }}
    <ListItemSecondaryAction>
      <Tooltip title={React.string("Delete")}>
        <IconButton edge={IconButton.Edge._end}> <Delete onClick={handleDelete} /> </IconButton>
      </Tooltip>
    </ListItemSecondaryAction>
  </ListItem>
}
