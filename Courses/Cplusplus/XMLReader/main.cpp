#include <iostream>
// Library needed for processing XML documents
#include <QtXml>
// Library needed for processing files
#include <QFile>




int main()
{

    //The QDomDocument class represents an XML document.
    QDomDocument xmlBOM;


    // ___________________________
    // ::: Read data from file :::


    // Load xml file as raw data
    QFile f("/home/lacie/Downloads/reading-xml-files-with-qt/xml/billofmaterial.xml");
    if (!f.open(QIODevice::ReadOnly ))
    {
        // Error while loading file
        std::cerr << "Error while loading file" << std::endl;
        return 1;
    }
    // Set data into the QDomDocument before processing
    xmlBOM.setContent(&f);
    f.close();


    // _________________________
    // ::: Read the root tag :::

    // Extract the root markup
    QDomElement root=xmlBOM.documentElement();
    // Get root names and attributes
    QString Type=root.tagName();
    QString Board=root.attribute("BOARD","No name");
    int Year=root.attribute("YEAR","1900").toInt();

    // Display root data
    std::cout << "Type  = " << Type.toStdString().c_str() << std::endl;
    std::cout << "Board = " << Board.toStdString().c_str() << std::endl;
    std::cout << "Year  = " << Year << std::endl;
    std::cout << std::endl;


    // _________________
    // ::: Read data :::


    // Get the first child of the root (Markup COMPONENT is expected)
    QDomElement Component=root.firstChild().toElement();

    // Loop while there is a child
    while(!Component.isNull())
    {

        // Check if the child tag name is COMPONENT
        if (Component.tagName()=="COMPONENT")
        {

            // Read and display the component ID
            QString ID=Component.attribute("ID","No ID");

            // Get the first child of the component
            QDomElement Child=Component.firstChild().toElement();

            QString Name;
            double Value;

            // Read each child of the component node
            while (!Child.isNull())
            {
                // Read Name and value
                if (Child.tagName()=="NAME") Name=Child.firstChild().toText().data();
                if (Child.tagName()=="VALUE") Value=Child.firstChild().toText().data().toDouble();

                // Next child
                Child = Child.nextSibling().toElement();
            }

            // Display component data
            std::cout << "Component " << ID.toStdString().c_str() << std::endl;
            std::cout << "   Name  = " << Name.toStdString().c_str() << std::endl;
            std::cout << "   Value = " << Value << std::endl;
            std::cout << std::endl;

        }


        // Next component
        Component = Component.nextSibling().toElement();
    }

    return 0;
}
