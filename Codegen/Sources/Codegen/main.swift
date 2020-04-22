import ApolloCodegenLib
import FileProvider

let parentFolderOfScriptFile = FileFinder.findParentFolder()
//1) Get some directory references
//This is the directory that the entire project lives in.
let projectDirectory = parentFolderOfScriptFile.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()

//This is the directory for the Codegen
let codegenDirectory = projectDirectory.appendingPathComponent("Codegen")

//This will tack on a directory in the Codegen folder called "ApolloCLI". This is where the Apollo Node tools get downloaded and stored. I have told my .gitignore file to ignore this folder.
let cliFolderURL = codegenDirectory.appendingPathComponent("ApolloCLI")

//This is the folder in my Xcode project that I want the schema.json file to be downloaded and the API.swift file to be generated. All my <file>.graphql files are here.
let graphQLFolder = projectDirectory.appendingPathComponent("GraphQLSwiftUI").appendingPathComponent("GraphQL")

//2) Make the objects to hold the Yelp API information
let yelpGraphQLURL = URL(string: "https://api.yelp.com/v3/graphql")!

let yelpAPIKey: String = "qco6Jeyqwo8-v8QRaCxWSiO5Fwr7JhWOSObUthK4ajdFVGuTvPHNjmi_b9A_UaOAmJzo2Vt6GlEmyxJwIOs2yWXr3FcPK0x3QBA-YpLFPq-w_UnIl9Q4bb0_SumwXHYx"

//3) Make the ApolloSchemaOptions that will help accomplish our two tasks.
let schemaDownloadOptions: ApolloSchemaOptions = ApolloSchemaOptions.init(endpointURL: yelpGraphQLURL, header: "Authorization: Bearer \(yelpAPIKey)", outputFolderURL: graphQLFolder)

let codeGenerationOption: ApolloCodegenOptions = ApolloCodegenOptions.init(targetRootURL: graphQLFolder)

do {
    
    //3) Perform our two tasks.
    //Do the schema download
    try ApolloSchemaDownloader.run(with: cliFolderURL, options: schemaDownloadOptions)
    //Do the code generation
    try ApolloCodegen.run(from: graphQLFolder, with: cliFolderURL, options: codeGenerationOption)
    
}catch{
    print(error)
    exit(1)
}
