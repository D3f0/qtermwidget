%Module QTermWidget 0

%Import QtCore/QtCoremod.sip
%Import QtGui/QtGuimod.sip


class QTermWidget : QWidget {

%TypeHeaderCode
#include <../lib/qtermwidget.h>
%End

public:
	QTermWidget(int startnow = 1, QWidget *parent = 0);
	~QTermWidget();
	enum ScrollBarPosition
    {
        NoScrollBar=0,
        ScrollBarLeft=1,
        ScrollBarRight=2
    };
	void setTerminalFont(QFont &font);
    void setShellProgram(const QString & progname);
	void setArgs(QStringList &args);
	void setTextCodec(QTextCodec *codec);
	void setColorScheme(const char *scheme);
	void setSize(int h, int v);
	void setHistorySize(int lines);
	void setScrollBarPosition(ScrollBarPosition);
	void sendText(QString &text);
	
    // Comentario
    
//start shell program if it was not started in constructor
    void startShellProgram();

    int getShellPID();

    void changeDir(const QString & dir);

    //look-n-feel, if you don`t like defaults

    //  Terminal font
    // Default is application font with family Monospace, size 10
    // USE ONLY FIXED-PITCH FONT!
    // otherwise symbols' position could be incorrect
    //void setTerminalFont(QFont & font);

    void setTerminalOpacity(qreal level);

    //environment
    void setEnvironment(const QStringList & environment);

    //  Shell program, default is /bin/bash
    //void setShellProgram(const QString & progname);

    //working directory
    void setWorkingDirectory(const QString & dir);

    

    //Color scheme, default is white on black
    void setColorScheme(const QString & name);
    static QStringList availableColorSchemes();

    // Wrapped, scroll to end.
    void scrollToEnd();

    
    // Sets whether flow control is enabled
    void setFlowControlEnabled(bool enabled);

    
    /**
     * Sets whether the flow control warning box should be shown
     * when the flow control stop key (Ctrl+S) is pressed.
     */
    void setFlowControlWarningEnabled(bool enabled);

    /*! Get all available keyboard bindings
     */
    static QStringList availableKeyBindings();

    //! Return current key bindings
    QString keyBindings();




signals:
    void finished();
    void copyAvailable(bool);

    void termGetFocus();
    void termLostFocus();

    void termKeyPressed(QKeyEvent *);

public slots:
    // Paste clipboard content to terminal
    void copyClipboard();

    // Copies selection to clipboard
    void pasteClipboard();

    /*! Set named key binding for given widget
     */
    void setKeyBindings(const QString & kb);

protected slots:
    void sessionFinished();
    void selectionChanged(bool textSelected);

protected:
	void resizeEvent(QResizeEvent *e);
private:
	void *createTermWidget(int startnow, void *parent); 
	
};
