const http = require('http');

const requestListener = function (req, res) {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`); // 方便看日誌
  
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello, World! from hgcbjjy on Apply.Build');
};

const port = process.env.PORT || 8080;

const server = http.createServer(requestListener);

server.listen(port, '0.0.0.0', () => {
  console.log(`🚀 Server started successfully on port ${port}`);
  console.log(`Listening on http://0.0.0.0:${port}`);
});
