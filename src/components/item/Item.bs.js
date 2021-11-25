// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Core from "@material-ui/core";
import * as IndexModuleScss from "./index.module.scss";
import * as MaterialUi_TextField from "rescript-material-ui/src/MaterialUi_TextField.bs.js";
import * as MaterialUi_IconButton from "rescript-material-ui/src/MaterialUi_IconButton.bs.js";
import Check from "@material-ui/icons/Check";
import Cancel from "@material-ui/icons/Cancel";
import Delete from "@material-ui/icons/Delete";

var styles = IndexModuleScss;

function Item(Props) {
  var todo = Props.todo;
  var dispatch = Props.dispatch;
  var i = Props.i;
  var opened = todo.opened;
  var content = todo.content;
  var match = React.useState(function () {
        return content;
      });
  var setValue = match[1];
  var value = match[0];
  var onChange = function (e) {
    return Curry._1(setValue, e.target.value);
  };
  var handleUpdate = function (param) {
    return Curry._1(dispatch, {
                TAG: /* Update */2,
                value: value,
                i: i
              });
  };
  var handleDelete = function (param) {
    return Curry._1(dispatch, {
                TAG: /* Remove */0,
                _0: i
              });
  };
  var handleListItemClick = function (param) {
    if (!opened) {
      return Curry._1(dispatch, {
                  TAG: /* Toggle */3,
                  _0: i
                });
    }
    
  };
  var handleCancel = function (param) {
    Curry._1(dispatch, {
          TAG: /* Toggle */3,
          _0: i
        });
    return Curry._1(setValue, (function (param) {
                  return content;
                }));
  };
  return React.createElement(Core.ListItem, {
              button: true,
              children: opened ? React.createElement(React.Fragment, undefined, React.createElement(Core.TextField, {
                          autoFocus: true,
                          onChange: onChange,
                          value: MaterialUi_TextField.Value.string(value)
                        }), React.createElement(Core.ListItemIcon, {
                          children: React.createElement(Core.Tooltip, {
                                children: React.createElement(Check, {
                                      onClick: handleUpdate
                                    }),
                                title: "Confirm"
                              })
                        }), React.createElement(Core.ListItemSecondaryAction, {
                          children: React.createElement(Core.Tooltip, {
                                children: React.createElement(Core.IconButton, {
                                      onClick: handleCancel,
                                      children: React.createElement(Cancel, {}),
                                      edge: MaterialUi_IconButton.Edge._end
                                    }),
                                title: "Cancel"
                              })
                        })) : React.createElement(React.Fragment, undefined, React.createElement(Core.ListItemText, {
                          primary: content,
                          style: {
                            cursor: "pointer"
                          }
                        }), React.createElement(Core.ListItemSecondaryAction, {
                          children: React.createElement(Core.Tooltip, {
                                children: React.createElement(Core.IconButton, {
                                      onClick: handleDelete,
                                      children: React.createElement(Delete, {}),
                                      edge: MaterialUi_IconButton.Edge._end
                                    }),
                                title: "Delete"
                              })
                        })),
              className: styles.item,
              onClick: handleListItemClick
            });
}

var make = Item;

export {
  styles ,
  make ,
  
}
/* styles Not a pure module */
