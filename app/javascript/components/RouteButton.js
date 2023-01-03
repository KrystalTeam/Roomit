import React from 'react';

class RouteButton extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <button
        className='absolute flex items-center justify-center p-2 text-3xl bg-white border rounded-full shadow-none left-2 top-2 min-h-min hover:shadow-xl'
        onClick={this.props.onClick}
      >
        <i className='fa-solid fa-route gradient-text'></i>
      </button>
    );
  }
}

export default RouteButton;
