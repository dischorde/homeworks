import React, { Component } from 'react';

const giphysIndexItems = (giphys) => {
  return giphys.map((giphy, i) => (
    <li key={i}><img src={giphy.images.fixed_height.url}></img></li>
  ));
};

const GiphysIndex = ({giphys}) => {


  return (
    <ul>
      {giphysIndexItems(giphys)}
    </ul>
  );
};

export default GiphysIndex;
