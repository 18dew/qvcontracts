const QVF = artifacts.require("QVFactory");
const TC = artifacts.require("TokenContract");

module.exports = function( deployer ) {
  console.log("Contract Deployment Started - QV Factory ")
  deployer.deploy( QVF , TC.address ).then( async function ( govC ) {
    console.log("Contract Setup Started - QV Factory ")


    console.log("Contract Setup Ended - QV Factory ")
  });
  console.log("Contract Deployment Ended - QV Factory ")
};
