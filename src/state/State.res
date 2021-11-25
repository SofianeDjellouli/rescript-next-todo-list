type todo = {content: string, opened: bool}

type state = {
  todos: array<todo>,
  input: string,
}

let defaultState = {todos: [], input: ""}

type action =
  Add | Remove(int) | InputChange(string) | Update({value: string, i: int}) | Toggle(int)

let reducer = (state, action) =>
  switch action {
  | Add => {
      input: "",
      todos: state.todos->Js.Array2.concat([{content: state.input, opened: false}]),
    }
  | Remove(i) => {...state, todos: state.todos->Js.Array2.filteri((_, index) => index != i)}
  | InputChange(value) => {...state, input: value}
  | Update({value, i}) => {
      ...state,
      todos: state.todos->Js.Array2.mapi((todo, index) => {
        if i === index {
          {content: value, opened: false}
        } else {
          todo
        }
      }),
    }
  | Toggle(i) => {
      ...state,
      todos: state.todos->Js.Array2.mapi((e, index) => {
        let opened = if i === index {
          !e.opened
        } else {
          false
        }

        {...e, opened: opened}
      }),
    }
  }
