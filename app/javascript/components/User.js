import React from "react"
import PropTypes from "prop-types"

class User extends React.Component {
  render () {
    return (
      <React.Fragment>
        Abc: {this.props.abc}
      </React.Fragment>
    );
  }
}

User.propTypes = {
  abc: PropTypes.node
};
export default User
