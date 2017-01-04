import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  handleChange(e) {
    console.log(e.currentTarget.value);
    this.setState({ searchTerm: e.currentTarget.value});
  }

  render () {
    return (
      <div>
      <form onSubmit={this.handleSubmit}>
          <input onChange={this.handleChange} value={this.state.searchTerm}>
          </input>
        <button>Search Giphys!</button>
      </form>
      <GiphysIndex giphys={this.props.giphys} />
    </div>
    );
  }
}

export default GiphysSearch;
