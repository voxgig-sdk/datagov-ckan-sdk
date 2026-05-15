
const { DocGen } = require('@voxgig/docgen')

const config = {
  root: __dirname+'/../dist/DocStaticRoot.js',
  folder: __dirname+'/../../doc',
  meta: {
    name: 'datagov-ckan'
  },
  model: {
    folder: __dirname+'/../model',
  },
}

module.exports = DocGen.makeBuild(config)
