@module external styles: {..} = "./index.module.scss"

@react.component
let make = (~todo: Todo.t) => {
  let (toggled, toggle) = UseToggle.useToggle()

  let handleButtonClick = _ => {
    toggle()
  }

  <li className={styles["item"]}>
    {if toggled {
      <div>
        <input value={todo.content} readOnly={true} />
        <button onClick={handleButtonClick}> {React.string("Update")} </button>
      </div>
    } else {
      <div onClick={_ => toggle()}> {React.string(todo.content)} </div>
    }}
  </li>
}
