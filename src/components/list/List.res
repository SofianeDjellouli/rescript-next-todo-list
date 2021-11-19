type state = {todos: array<Todo.t>, input: string}

let defaultState = {todos: [], input: ""}

type action = Add | Remove({id: int}) | InputChange({value: string})

let reducer = (state, action) =>
  switch action {
  | Add => {
      input: "",
      todos: state.todos->Js.Array2.concat([{content: state.input}]),
    }
  | Remove({id}) => {...state, todos: state.todos->Js.Array2.filteri((_, i) => i != id)}
  | InputChange({value}) => {...state, input: value}
  }

@genType("List") @react.component
let make = () => {
  let ({todos, input}, dispatch) = React.useReducer(reducer, defaultState)

  let onChange = event => {
    let value = ReactEvent.Form.target(event)["value"]

    dispatch(InputChange({value: value}))
  }

  let handleDispatch = _ => dispatch(Add)

  let onKeyPress = event =>
    if ReactEvent.Keyboard.key(event) === "Enter" {
      handleDispatch()
    }

  Js.log(Js.Array2.mapi((todo, i) => <Item key={i->Js.Int.toString} todo />))

  <>
    <div>
      <input value={input} onChange onKeyPress />
      <button onClick={handleDispatch}> {React.string("Add")} </button>
    </div>
    {if todos->Js.Array2.length == 0 {
      <p> {React.string("You haven't added anything to your list yet.")} </p>
    } else {
      <ol>
        {todos->Js.Array2.mapi((todo, i) => <Item key={i->Js.Int.toString} todo />)->React.array}
      </ol>
    }}
  </>
}
