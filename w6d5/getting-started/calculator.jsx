import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "" };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.performCalc = this.performCalc.bind(this);
    this.clear = this.clear.bind(this);

  }

  setNum1(e) {
    let num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(e) {
    let num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
  }

  performCalc(e) {
    e.preventDefault();
    let result;
    switch (e.target.value) {
      case "+":
        result = this.state.num1 + this.state.num2;
        break;
      case "-":
        result = this.state.num1 - this.state.num2;
        break;
      case "*":
        result = this.state.num1 * this.state.num2;
        break;
      case "/":
        result = this.state.num1 / this.state.num2;
        break;
      default:
        break;
    }
    this.setState({ result });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ num1: "", num2: "", result: 0});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input
          onChange={this.setNum1}
          value={this.state.num1} />
        <input
          onChange={this.setNum2}
          value={this.state.num2} />
        <br />
        <button
          onClick={this.performCalc}
          value="+">+</button>
        <button
          onClick={this.performCalc}
          value="-">-</button>
        <button
          onClick={this.performCalc}
          value="*">*</button>
        <button
          onClick={this.performCalc}
          value="/">/</button>
        <button
          onClick={this.clear}
          value="clear">clear</button>
      </div>
    );
  }
}

export default Calculator;
