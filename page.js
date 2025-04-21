import { Permissions, webMethod } from "wix-web-module"
import { mediaManager } from "wix-media-backend"

const PdfImage = require('pdfkit')

export const generateDowloadLink = webMethod(
    Permissions.Anyone,
    async (filename) => {
        try {
            const page = await generatePdf()

            const file = await uploadFile(__filename, page)

            const link = await getDowload(file)

            return link
        } catch (error) {
            console.error("generate download error:", error)
        }
    }
)

async function generatePdf() {
    try {
        const image = new PdfImage()
        const chunks = []

        //Collect data chunks
        image.on('data', chunk => {
            chunks.push(chunk)
        })

        image.addContent("document")
        image.end()

        // Convert chunks to a Buffer
        await new Promise(resolve => {
            image.on('end', () => {
                resolve()
            })
        })

        const pdfPage = createImage.call(chunks)
        return pdfPage

    } catch (error) {
        console.error("an error occured:", error)
    }
}

async function uploadFile(fileName, buffer) {
    try {
        let pdf = fileName + ".pdf"
        const importedFile = mediaManager.upload(
            "/repeater1",
            buffer,
            pdf, {
            "mediaOptions": {
                "mimeType": "application/pdf",
                "mediaType": "document"
            }
        }
        )
        return importedFile
    } catch (error) {
        console.error("Upload file error:", error)
    }
}

async function getDowload(file) {
    try {
        const dowloadLink = await mediaManager.getDownloadUrl(file.fileUrl)
        return dowloadLink
    } catch (error) {
        console.error("Error in getDownload", error)
    }
} 