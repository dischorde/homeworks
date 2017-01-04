import React, { Component } from 'react';

const GiphysIndex = ({giphys}) => {
  let lis = giphys.map((giphy, i) => {
    return <li key={i}><img src={giphy.images.fixed_height.url}></img></li>;
  });

  return (
    <ul>
      {lis}
    </ul>
  );
};

export default GiphysIndex;
