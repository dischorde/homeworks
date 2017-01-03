import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';


const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  store.dispatch(action);
  console.log(store.getState());
};

const applyMiddlewares = (store, ...middlewareList) => {
  let dispatch = store.dispatch;
  middlewareList.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = applyMiddlewares(configureStore(preloadedState), addLoggingToDispatch);
  window.dispatch = store.dispatch;
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
