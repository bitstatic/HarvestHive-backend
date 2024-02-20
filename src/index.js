const express = require('express')

const userRouter = require('../routers/userRouter')
const itemRouter = require('../routers/itemRouter')
require('../db/mongoose')


const app = express()
app.use(express.json())

app.use(userRouter)
app.use(itemRouter)

const port = process.env.PORT

app.listen(port, () => {
    console.log('server listening on port ' + port)
})