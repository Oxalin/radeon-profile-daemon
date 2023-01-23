#include <QCoreApplication>
#include "rpdthread.h"

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // Setting the Application version
    app.setApplicationVersion(appVersion);

    rpdThread daemon;
    daemon.start();

    return app.exec();
}
