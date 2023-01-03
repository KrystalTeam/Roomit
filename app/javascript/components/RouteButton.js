import React from 'react'

class RouteButton extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <button
        className="absolute left-2 top-2 text-3xl text-white"
        onClick={this.props.onClick}
      >
        <i className="fa-solid fa-route"></i>
      </button>
    )
  }
}

export default RouteButton