type state = {todos: array<Todo.t>, input: string}

let defaultState = {todos: [], input: ""}

type action = Add | Remove(int) | InputChange(string) | Update({value: string, i: int})

let reducer = (state, action) =>
  switch action {
  | Add => {
      input: "",
      todos: state.todos->Js.Array2.concat([{content: state.input}]),
    }
  | Remove(i) => {...state, todos: state.todos->Js.Array2.filteri((_, index) => index != i)}
  | InputChange(value) => {...state, input: value}
  | Update({value, i}) => {
      let index = state.todos->Js.Array2.findIndexi((_, index) => index == i)

      if index > -1 {
        state.todos[index].content = value
      }

      state
    }
  }
