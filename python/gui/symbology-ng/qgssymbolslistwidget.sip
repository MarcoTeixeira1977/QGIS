class QgsSymbolsListWidget : QWidget
{
%TypeHeaderCode
#include <qgssymbolslistwidget.h>
%End
  public:
    QgsSymbolsListWidget( QgsSymbol *symbol, QgsStyle *style, QMenu *menu, QWidget *parent /TransferThis/ = 0, const QgsVectorLayer *layer = 0 );

    /** Sets the context in which the symbol widget is shown, e.g., the associated map canvas and expression contexts.
     * @param context symbol widget context
     * @see context()
     * @note added in QGIS 3.0
     */
    void setContext( const QgsSymbolWidgetContext &context );

    /** Returns the context in which the symbol widget is shown, e.g., the associated map canvas and expression contexts.
     * @see setContext()
     * @note added in QGIS 3.0
     */
    QgsSymbolWidgetContext context() const;

    /** Returns the vector layer associated with the widget.
     * @note added in QGIS 2.12
     */
    const QgsVectorLayer *layer() const;

  public slots:

    void setSymbolFromStyle( const QModelIndex &index );
    void setSymbolColor( const QColor &color );
    void setMarkerAngle( double angle );
    void setMarkerSize( double size );
    void setLineWidth( double width );
    void addSymbolToStyle();
    void saveSymbol();
    void symbolAddedToStyle( const QString &name, QgsSymbol *symbol );
    void on_mSymbolUnitWidget_changed();
    void on_mTransparencySlider_valueChanged( int value );

    //! Pupulates the groups combo box with available tags and smartgroups
    void populateGroups();
    void on_groupsCombo_currentIndexChanged( int index );

    void openStyleManager();
    void clipFeaturesToggled( bool checked );

    void updateDataDefinedMarkerSize();
    void updateDataDefinedMarkerAngle();
    void updateDataDefinedLineWidth();

  signals:
    void changed();
};
