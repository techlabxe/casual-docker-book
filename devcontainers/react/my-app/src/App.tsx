import React, { useState } from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  const onAddButtonClicked = () => {
    console.log('Add Clicked');
    setCount( (prevCount) => prevCount + 1);
  };
  const onDecButtonClicked = () => {
    console.log('Dec Clicked');
    setCount( (prevCount) => {
      return prevCount -1;
    } );
  };
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <div>
          <p>current : {count} </p>
          <button onClick={onAddButtonClicked}>Add</button>
          <button onClick={onDecButtonClicked}>Dec</button>
        </div>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
