OracleSpace Chainlink Public Jobs on Arbitrum Goerli
List of jobs
Job	Availability / Cost / Limits
HTTP Get > Bool	⏳ Coming Soon
HTTP Get > Bytes	⏳ Coming Soon
HTTP Get > Bytes[]	⏳ Coming Soon
HTTP Get > Uint256	✅ / 0.05 LINK / 🟢
HTTP Get > Uint256,Uint256	⏳ Coming Soon
HTTP Get > Uint256[]	❌

Perform HTTP Get request, parse JSON response and fill uint256.

Use in Your Contract
Operator Contract: 0xB7a5181B507B3c7A70Bb633E118cd0f3d919143a
JobID: beb323d08e56408a8c85271b2db4f196

Price
0.05 LINK

LINK Parameters
OracleSpace HTTP Get > Uint256 on Arbitrum Goerl
The job requires the following parameters to be specified:

get - internet-facing URL from where the data is retrieved
multiply - int256
path - comma-separated JSON path used to extract the value
Test Parameters
get - https://raw.githubusercontent.com/oraclespace/chainlink-node-public-jobs/master/example-data/numbers.json
multiply - 100
path - data,prices,LINK
REST requests limitations
HTTPS only
SSL certificate must be valid
Response size limited to 5MB
Response timeout - 30s

Ref: https://github.com/oraclespace/chainlink-node-public-jobs
