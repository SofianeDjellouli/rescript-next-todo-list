// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Item from "../item/Item.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as State from "./State.bs.js";
import * as React from "react";
import * as Core from "@material-ui/core";
import * as MaterialUi_Button from "rescript-material-ui/src/MaterialUi_Button.bs.js";
import * as MaterialUi_TextField from "rescript-material-ui/src/MaterialUi_TextField.bs.js";

function TodoList(Props) {
  var match = React.useReducer(State.reducer, State.defaultState);
  var state = match[0];
  var todos = state.todos;
  var dispatch = match[1];
  var onChange = function (e) {
    var value = e.target.value;
    return Curry._1(dispatch, {
                TAG: /* InputChange */1,
                _0: value
              });
  };
  var handleSubmit = function (e) {
    e.preventDefault();
    var length = state.input.length;
    if (length > 0) {
      return Curry._1(dispatch, /* Add */0);
    } else {
      window.alert("Nothing to add!");
      return ;
    }
  };
  return React.createElement(React.Fragment, undefined, React.createElement("form", {
                  onSubmit: handleSubmit
                }, React.createElement(Core.TextField, {
                      onChange: onChange,
                      value: MaterialUi_TextField.Value.string(state.input)
                    }), React.createElement(Core.Button, {
                      children: "Add",
                      type: MaterialUi_Button.Type.string("submit"),
                      variant: "contained"
                    })), todos.length === 0 ? React.createElement("p", undefined, "You haven't added anything to your list yet.") : React.createElement(Core.List, {
                    children: todos.map(function (todo, i) {
                          return React.createElement(Item.make, {
                                      todo: todo,
                                      dispatch: dispatch,
                                      i: i,
                                      key: i.toString()
                                    });
                        })
                  }));
}

var make = TodoList;

export {
  make ,
  
}
/* Item Not a pure module */