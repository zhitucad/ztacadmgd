<?xml version="1.0"?><doc>
<members>
<member name="T:AcRxOverruleIteratorBase" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="21">
<description>
Internal use only. Base class for all overrules.
</description>                                                      
</member>
<member name="T:AcRxOverrule" decl="false" source="c:\objectarx\inc\rxoverrule.h" line="36">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
AcRxOverrule is an abstract base class for implementing
overrules. Overrule providers register and unregister their
overrules through addOverrule and removeOverrule. Overrules
can be globally activated or deactivated by setIsOverruling.
It can also be queried by isOverruleing.

Overrules are internally managed by pairs of "targetClass"
and "overrule". The "targetClass" is the class that
"overrule" is intended to own. Each class can have multiple
overrules registered and their order is implied by the order
they are registered.

Each derived overrule class should provide some or all
default implementations that delegate to the default behavior
for the targeted class. 
</description>  
</member>
<member name="M:AcRxOverrule.isApplicable(AcRxObject!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\rxoverrule.h" line="64">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Used to make per-instance determination whether the overrule is applicable.
</description>
<returns>
Returns true if overruling of the overrule should be applied when queried, false otherwise.
</returns>
<param name="pOverruledSubject">Pointer to an AcRxObject to check.</param>
<remarks>
If pOverruledSubject is database resident then it is open for read. 
</remarks>                                                   
</member>
<member name="M:AcRxOverrule.addOverrule(AcRxClass*,AcRxOverrule*,System.Boolean)" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="78">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Registers an overrule object to an AcRxClass.
</description>
<param name="pClass">Pointer to an AcRxClass to which "pOverrule" is intended to apply.</param>
<param name="pOverrule">Pointer to an AcRxOverrule derived object to overrule.</param>
<param name="bAddAtLast">Indicates whether the {pClass, pOverrule} pair should be added at
                         the end of the overrule's collection.</param>
<remarks>
You should ensure "pOverrule" is appropriate for "pClass". If "pOverrule" can't
overrule behaviors in "pClass", then "pOverrule" will have no effect. If more than one
overrule specifies bAddAtLast to be true, then their orders will be determined
by last in first out.
</remarks>
<returns>
Returns true if the overrule is successfully added.
</returns>                                                       
</member>
<member name="M:AcRxOverrule.removeOverrule(AcRxClass*,AcRxOverrule*)" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="97">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Unregister an overrule object from an AcRxClass.
</description>
<param name="pClass">AcRxClass to which "pOverrule" was applied.</param>
<param name="pOverrule">AcRxOverrule derived object to remove.</param>
<remarks>
The parameters should match the parameters when addOverrule was called.
</remarks>
<returns>
Returns Acad::Ok if the overrule was registered and is now removed from the overrule collection by this call.
</returns>                                                 
</member>
<member name="M:AcRxOverrule.setIsOverruling(System.Boolean)" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="112">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Globally (application-wise) enable or disable overruling mechanism.
</description>
<param name="bIsOverruling">True to enable overruling, false to disable.</param>
<remarks>
Overrule can be turned ON or OFF across the entire application. Does not
support per-document enabling or disabling.
</remarks>                                                  
</member>
<member name="M:AcRxOverrule.isOverruling" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="123">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Queries if the global overruling flag is true or false.
</description>
<returns>
Returns true if overruling is currently turned on, false otherwise. 
</returns>                                                  
</member>
<!-- 丢弃成员“M:AcRxOverrule.hasOverrule(AcRxObject!System.Runtime.CompilerServices.IsConst*,AcRxClass*)”的格式错误的 XML 文档注释。 -->
<member name="T:AcRxQueryXOverrule" decl="false" source="c:\objectarx\inc\rxoverrule.h" line="152">
<property name="versionspecific" value="=19.0.0.0"/>

<description>
AcRxQueryXOverrule overrules the queryX method of AcRxObject
</description>
</member>
<member name="M:AcRxQueryXOverrule.#ctor" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="162">
<property name="versionspecific" value="=19.0.0.0"/>

<description>
Default Constructor.
</description>
</member>
<member name="M:AcRxQueryXOverrule.queryX(AcRxObject!System.Runtime.CompilerServices.IsConst*,AcRxClass!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\rxoverrule.h" line="169">
<property name="versionspecific" value="=19.0.0.0"/>

<description>
Overrules AcRxObject::queryX.
</description>
<param name="pSubject">Pointer to an AcRxObject that this overrule is applied against.
</param>
<returns>Returns a protocol extension object associated with this object
</returns>
<remarks>
The default implementation of AcRxQueryXOverrule::queryX calls the 
protected AcRxObject::subQueryX method.
</remarks>
</member>
<member name="T:AcGiDrawableOverrule" decl="false" source="c:\objectarx\inc\drawable.h" line="191">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
AcGiDrawableOverrule overrules a subset of draw related
operations that AcGiDrawable class specifies. It is intended
as a base class for clients who want to alter some or all
behavior of a given AcGiDrawable-derived class. At the base
level, each default implementation simply calls the
corresponding method in the target class.
</description>  
</member>
<member name="M:AcGiDrawableOverrule.setAttributes(AcGiDrawable*,AcGiDrawableTraits*)" decl="true" source="c:\objectarx\inc\drawable.h" line="207">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Overrules AcGiDrawable::setAttributes method.
</description>
<remarks>
The default implementation of
AcGiDrawableOverrule::setAttributes calls
AcGiDrawable::subSetAttributes.
</remarks>
<param name="pSubject">Pointer to an AcRxObject that this
                       overrule is applied against.</param>
<param name="traits">Pointer to the graphics traits.</param>
</member>
<member name="M:AcGiDrawableOverrule.worldDraw(AcGiDrawable*,AcGiWorldDraw*)" decl="true" source="c:\objectarx\inc\drawable.h" line="221">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Overrules AcGiDrawable::worldDraw.
</description>
<param name="pSubject">Pointer to an AcRxObject that this
                       overrule is applied against.</param>
<param name="wd">Pointer to the graphics traits.</param>
<remarks>
The default implementation of AcGiDrawableOverrule::worldDraw
calls the protected virtual AcGiDrawable::subWorldDraw
method. 
</remarks>                                                   
</member>
<member name="M:AcGiDrawableOverrule.viewportDraw(AcGiDrawable*,AcGiViewportDraw*)" decl="true" source="c:\objectarx\inc\drawable.h" line="235">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Overrules AcGiDrawable::viewportDraw method.
</description>
<remarks>
Default implementation of AcGiDrawableOverrule::viewportDraw
calls protected virtual AcGiDrawable::subViewportDraw method.

</remarks>                                                   
</member>
<member name="M:AcGiDrawableOverrule.viewportDrawLogicalFlags(AcGiDrawable*,AcGiViewportDraw*)" decl="true" source="c:\objectarx\inc\drawable.h" line="246">
<property name="versionspecific" value="=18.0.0.0"/>

<description>
Overrules AcGiDrawable::viewportDrawLogicalFlags method.
</description>
<remarks>
The default implementation of AcGiDrawableOverrule::
viewportDrawLogicalFlags calls the protected virtual
AcGiDrawable:: subViewportDrawLogicalFlags method. 
</remarks>                                              
</member>
<member name="T:AcDb.ImplicitPointType" decl="false" source="c:\objectarx\inc\acdb.h" line="1523">
<summary>
The type of a constrained implicit point.
</summary>

</member>
<member name="F:kStartImplicit" decl="false" source="c:\objectarx\inc\acdb.h" line="1529">
<summary>
Start point of bounded line, arc or bounded ellipse.
</summary>

</member>
<member name="F:kEndImplicit" decl="false" source="c:\objectarx\inc\acdb.h" line="1535">
<summary>
End point of a bounded line (not valid for ray), arc or bounded ellipse.
</summary>

</member>
<member name="F:kMidImplicit" decl="false" source="c:\objectarx\inc\acdb.h" line="1541">
<summary>
Mid point of a bounded line (not valid for ray) or arc.
</summary>

</member>
<member name="F:kCenterImplicit" decl="false" source="c:\objectarx\inc\acdb.h" line="1547">
<summary>
Center point of a circle, arc, ellipse or bounded ellipse.
</summary>

</member>
<member name="F:kDefineImplicit" decl="false" source="c:\objectarx\inc\acdb.h" line="1553">
<summary>
Define point of a parametric curve, currently only valid for spline control point.
</summary>

</member>
<member name="M:AcDbAuditInfo.fetchObject(AcDbObjectId,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcRxClass*,System.Boolean,System.Boolean,System.Boolean)" decl="true" source="c:\objectarx\inc\dbaudita.h" line="119">
<summary>
fetchObject is invoked from AcDbObject::audit() override members, as
well as the AcDb recovery-audit complex.   Its purpose is to retrieve
an object id based on the input object id.   It will usually be the
same object id as is passed in, but can differ when recover logic
creates new objects under new object ids.
</summary>

<param name="originalObjId">
The object id read in from the DWG file.
</param>

<param name="newObjId">
The object id to use insetad of originalObjId.
</param>

<param name="pObjClass">
The anticipated class of the missing-corrupted object.
</param>

<param name="uneraseIfPossible">
If true, and the referenced object is erased, it will be
unerased if the object permits itself to be unerased.
</param>

<param name="createIfNotFound">
Every call to fetchObject with this parameter set to true will
cause the object recreation mechanism to be invoked.
if false, then fetchObject will return results based on what is
already in the lookup table.
</param>

<param name="externalDbOk">
true implies that objId and newObjId can reside in another database.
Note:  Not yet implemented.
</param>

<returns>
The following ErrorStatus values can be returned from this function.
eOk:                   Success, objId has a valid valuel
eInvalidInput:         Errors include newObjId being NULL and pObjClass
                       being NULL.
eNotImplementedYet:    returned if externalDbOk is true and newObjId is
                       from an external database.
eInvalidXrefObjectId:  objId cannot be a forwarding reference to another
                       object Id in an xref database.
eWasErased:            if an object is erased and the uneraseIfPossible
                       parameter is false or the object cannot be unerased.
eNullObjectPointer and    
eNullObjectId:         if a valid object cannot be returned for various
                       reasons.
</returns>

<remarks>
If eOk is returned, then newObjId will be valid and should be used (and
will most often be the same as objId).
If any other value is returned, then both objId and newObjId should be
considered to be invalid.
</remarks>

</member>
<member name="M:AcDbAuditInfo.registerObject(AcDbHandle,System.Boolean,AcRxClass*)" decl="true" source="c:\objectarx\inc\dbaudita.h" line="186">
<summary>
registerObject is invoked from AcDb Recover and Audit internals, and can
also be invoked from AcDbObject::audit(), dwgInFields() and any other
override members invoked during a recover operation and its subsequent
audit.   It is the easy way to make entries for valid objects, compared
to AcDbAuditInfo::updateObject, which has a much more verbose parameter
list.
</summary>

<param name="handle">
The handle of the original object, readily obtainable from an object
id as well.  It is the lookup key for indirect object lookup table
entries.
</param>

<param name="objIsValid">
A bool indicating whether the object is valid or not.  If true is
passed in, then the entire lookup table entry is filled out with
the handle pointing to its own object id as its replacement.
</param>

<param name="pObjClass">
The anticipated or known class of the missing-corrupted object.
</param>

<returns>
The following ErrorStatus values can be returned from this function.
eOk:                   Success, objId has a valid value.
eInvalidInput:         The input handle cannot be null (0).
eHandleInUse:          Returned if this function is invoked more than
                       once for the input handle in a single recover
                       operation.
</returns>

<remarks>
The Recover logic usually populates the indirect object table
with entries that map object ids to themselves.   But it can be invoked by
applications as well.

Once objIsValid is passed in as false, AcDbAuditInfo::updateObject
must be invoked to establish the new object id.
</remarks>

</member>
<member name="M:AcDbAuditInfo.updateObject(AcDbHandle,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,AcRxClass*,AcRxClass*,AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbaudita.h" line="233">
<summary>
updateObject is invoked from AcDb Recover and Audit internals, and can
also be invoked from AcDbObject::audit(), dwgInFields() and any other
override members invoked during a recover operation and its subsequent
audit. 
</summary>

<param name="setFileObjIsValid">
Boolean indicating whether the fileObjIsValid parameter should
replace the corresponding field in the lookup table entry.
</param>

<param name="setNewObjIsValid">
Boolean indicating whether the newObjIsValid parameter should
replace the corresponding field in the lookup table entry.
</param>

<param name="setFileObjClass">
Boolean indicating whether the fileObjClass parameter should
replace the corresponding field in the lookup table entry.
</param>

<param name="setNewObjClass">
Boolean indicating whether the setNewObjClass parameter should
replace the corresponding field in the lookup table entry.
</param>

<param name="setNewObjId">
Boolean indicating whether the newObjId parameter should
replace the corresponding field in the lookup table entry.
</param>

<param name="fileObjIsValid">
A bool indicating whether the object image in the DWG file was
valid or not.
</param>

<param name="newObjIsValid">
A bool indicating whether the object under newObjId is
valid or not.   If not set to true, then fetchObject on
objectHandle will return eNullObjectPointer.
</param>

<param name="pFileObjClass">
The original class of the missing or corrupted object.
</param>

<param name="pNewObjClass">
The class of the original or replacement object.
</param>

<param name="newObjId">
Boolean indicating whether the newObjId parameter should
replace the corresponding field in the lookup table entry.
Usually that of objectHandle unless the object id had to
be redirected.
</param>

<returns>
The following ErrorStatus values can be returned from this function.
eOk:                   Success, the indicated fields were replaced.
eInvalidInput:         The input handle cannot be null (0).
</returns>

<remarks>
The Recover logic makes use of this member to indicated fixed up
objects and redirected object ids.  But it can be invoked by
applications as well.

This is the most powerful and most verbose way to create and update
entries for the indirect object lookup table; with a separate parameter
for every field in a table entry, and a boolean flag for each parameter,
indicating whether the corresponding parameter should replace the current
entry or not.
</remarks>

</member>
<member name="M:AcDbDatabase.thumbnailBitmap" decl="true" source="c:\objectarx\inc\dbmain.h" line="584">
<summary>
This function provides BITMAP thumbnail of database as return value
</summary>
<returns> This will return BITMAP thumbnail in void* buffer for database </returns>

</member>
<member name="M:AcDbDatabase.setThumbnailBitmap(System.Void*)" decl="true" source="c:\objectarx\inc\dbmain.h" line="591">
<summary>
This function sets BITMAP thumbnail into database
</summary>
<param name="pBmp"> A pointer of Bitmap thumbnail to be set into database </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>

</member>
<member name="M:AcDbDatabase.thumbnailImage(Atil.Image**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbmain.h" line="599">
<summary>
This function provides Atil::Image thumbnail of database as output
</summary>
<param name="pPreviewImage"> A reference to the pointer of Atil::Image thumbnail </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="M:AcDbDatabase.setThumbnailImage(Atil.Image!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbmain.h" line="608">
<summary>
This functions sets Atil::Image thumbnail into database
</summary>
<param name="pPreviewImage"> A pointer of Atil::Image thumbnail to be set into database </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="T:AcDbEntity.VisualStyleType" decl="false" source="c:\objectarx\inc\dbmain.h" line="1975">
<summary>
Enumerates the visual style types that can be set into an entity.
</summary>
</member>
<member name="F:kFullVisualStyle" decl="false" source="c:\objectarx\inc\dbmain.h" line="1980">
<summary>
Full visual style, defines the overall visual style of the entity.
</summary>
</member>
<member name="F:kFaceVisualStyle" decl="false" source="c:\objectarx\inc\dbmain.h" line="1985">
<summary>
Optional face-only visual style which can vary independently of 
the full visual style.
</summary>
</member>
<member name="F:kEdgeVisualStyle" decl="false" source="c:\objectarx\inc\dbmain.h" line="1991">
<summary>
Optional edge-only visual style which can vary independently of
the full visual style.
</summary>
</member>
<member name="M:AcDbEntity.setVisualStyle(AcDbObjectId,AcDbEntity.VisualStyleType,System.Int32)" decl="true" source="c:\objectarx\inc\dbmain.h" line="1998">
<summary>
Sets visual styles for the entity.  
</summary>
<param name="visualStyleId">
Input AcDbObjectId of the AcDbVisualStyle
</param>    
<param name="vsType">
Input VisualStyleType of the visual style type to set.
</param>    
<param name="doSubents">
Input bool, if true applies this visual style to all sub entities.  
</param>    
</member>
<member name="M:AcDbEntity.visualStyleId(AcDbEntity.VisualStyleType)" decl="true" source="c:\objectarx\inc\dbmain.h" line="2014">
<summary>
Gets the visual styles from the entity.
</summary>
<param name="vsType">
Input VisualStyleType of the visual style type to retrieve.
</param>    
<returns>
AcDbObjectId of the visual style.
</returns>    
</member>
<member name="T:AcRxProtocolReactor" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="73">
<summary>
The base class for all protocol reactors. All protocol reactor classes
must derive from this class. 
</summary>
</member>
<member name="T:AcRxProtocolReactorIterator" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="87">
<summary>
An iterator for enumerating AcRxProtocolReactors in an
AcRxProtocolReactorList. 
</summary>

<remarks>
Instances of this class are returned by
<c>AcRxProtocolReactorList::newIterator()</c>.
</remarks>

</member>
<member name="M:AcRxProtocolReactorIterator.reactorClass" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="105">
<summary>
Returns the AcRxClass type returned by the iterator.
</summary>

<returns>
A pointer to the AcRxClass type.
</returns>

</member>
<member name="M:AcRxProtocolReactorIterator.start" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="116">
<summary>
Rewinds the iterator to the beginning of the list.
</summary>

</member>
<member name="M:AcRxProtocolReactorIterator.next" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="122">
<summary>
Advances the iterator to the next item in the list.
</summary>

<returns>
True if there are more items in the list, false if the iterator has
reached the end of the list.
</returns>

</member>
<member name="M:AcRxProtocolReactorIterator.done" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="133">
<summary>
Determines whether the iterator has reached the end of the list.
</summary>

<returns>
True if there are more items in the list, false if the iterator has
reached the end of the list.
</returns>

</member>
<member name="M:AcRxProtocolReactorIterator.object" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="144">
<summary>
Returns the AcRxProtocolReactor at the current iterator position.
</summary>

<returns>
Returns a pointer to the AcRxProtocolReactor at the current iterator
position.
</returns>

</member>
<member name="T:AcRxProtocolReactorList" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="160">
<summary>
A simple collection of AcRxProtocolReactors. 
</summary>

<remarks>
Instances of this class contain a single kind of AcRxProtocolReactor.
Collections of this class are associated with an AcRxClass through the
protocol reactor framework and the AcRxProtocolReactorManager class.
</remarks>

</member>
<member name="M:AcRxProtocolReactorList.reactorClass" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="175">
<summary>
Returns the AcRxClass type returned by the iterator.
</summary>

<returns>
A pointer to the AcRxClass type.
</returns>
</member>
<member name="M:AcRxProtocolReactorList.addReactor(AcRxProtocolReactor*)" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="184">
<summary>
Adds a reactor to the collection. 
</summary>

<param name="pReactor">
A pointer to the reactor to add to the collection.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eWrongObjectType if 
<paramref name="pReactor"/> is not a kind of <c>reactorClass()</c>.
</returns>

</member>
<member name="M:AcRxProtocolReactorList.removeReactor(AcRxProtocolReactor*)" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="199">
<summary>
Removes a reactor from the collection.
</summary>

<param name="pReactor">
A pointer to the reactor to remove from the collection.
</param>

</member>
<member name="M:AcRxProtocolReactorList.newIterator" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="209">
<summary>
Obtains an iterator on the contents of the list.
</summary>

<returns>
A pointer to an AcRxProtocolReactorIterator that can be used to
enumerate the contents of the list.
</returns>

<remarks>
Callers are responsible for deleting the returned iterator. 
</remarks>

</member>
<member name="T:AcRxProtocolReactorListIterator" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="229">
<summary>
An iterator for enumerating AcRxProtocolReactorLists in an
AcRxProtocolReactorManager. 
</summary>

<remarks>
Instances of this class are returned by
<c>AcRxProtocolReactorManager::newIterator()</c>.
</remarks>

</member>
<member name="M:AcRxProtocolReactorListIterator.start" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="244">
<summary>
Rewinds the iterator to the beginning of the list.
</summary>

</member>
<member name="M:AcRxProtocolReactorListIterator.next" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="250">
<summary>
Advances the iterator to the next item in the list.
</summary>

<returns>
True if there are more items in the list, false if the iterator has
reached the end of the list.
</returns>

</member>
<member name="M:AcRxProtocolReactorListIterator.done" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="261">
<summary>
Determines whether the iterator has reached the end of the list.
</summary>

<returns>
True if there are more items in the list, false if the iterator has
reached the end of the list.
</returns>

</member>
<member name="M:AcRxProtocolReactorListIterator.object" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="272">
<summary>
Returns the AcRxProtocolReactorList at the current iterator position.
</summary>

<returns>
Returns a pointer to the AcRxProtocolReactorList at the current
iterator position.
</returns>

</member>
<member name="T:AcRxProtocolReactorManager" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="288">
<summary> 
Container class for a collection of AcRxProtocolReactorLists.
</summary>

<remarks>
Instances of AcRxProtocolReactorManagers are associated to AcRxClasses at
runtime using the protocol extension framework. Instances of this class
allow multiple kinds of AcRxProtocolReactors to be associated with a single
AcRxClass. 
</remarks>

</member>
<member name="M:AcRxProtocolReactorManager.createReactorList(AcRxClass*)" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="304">
<summary>
Returns an AcRxProtocolReactorList for a specific reactor class.
</summary>

<param name="pReactorClass">
A pointer to the AcRxClass of the reactor managed by the returned list. 
</param>

<returns>
A pointer to the AcRxProtocolReactorList.
</returns>

<remarks>
If a list for the reactor class does not exist a new one is created and
returned.
</remarks>

</member>
<member name="M:AcRxProtocolReactorManager.newIterator" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="324">
<summary>
Returns an iterator for all of the AcRxProtocolReactorLists instances
contained in the manager. 
</summary>

<returns>
A pointer to a new AcRxProtocolReactorListIterator that can be used to
enumerate the AcRxProtocolReactorList instances contained in the
manager. 
</returns>

<remarks>
Callers are responsible for deleting the returned iterator. 
</remarks>

</member>
<member name="T:AcRxProtocolReactorManagerFactory" decl="false" source="c:\objectarx\inc\rxprotevnt.h" line="345">
<summary>
A factory class for obtaining the single AcRxProtocolReactorManager
associated
</summary>

</member>
<!-- 丢弃成员“M:AcRxProtocolReactorManagerFactory.createReactorManager(AcRxClass*)”的格式错误的 XML 文档注释。 -->
<member name="M:AcDbCurve.getAcGeCurve(AcGeCurve3d**!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeTol!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbcurve.h" line="114">
<summary>
This function returns an AcGeCurve3d that is geometrically identical to
this AcDbCurve.
</summary>
<param name="pGeCurve">Output pointer to an AcGeCurve3d object that is
geometrically identical to this AcDbCurve.  The caller of this function
is responsible for deleting this AcGeCurve3d object.</param>
<param name="tol">Optional input tolerance.</param>
<returns>Returns eOk if successful.</returns>
</member>
<member name="M:AcDbCurve.createFromAcGeCurve(AcGeCurve3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbCurve**!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d*,AcGeTol!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbcurve.h" line="126">
<summary>
This function takes an AcGeCurve3d and returns an AcDbCurve that is
geometrically identical to the AcGeCurve3d.
</summary>
<param name="geCurve">Input reference to an AcGeCurve3d.</param>
<param name="pDbCurve">Output pointer to an AcDbCurve object that is
geometrically identical to geCurve.  The caller of this function is
responsible for deleting this AcDbCurve object or adding it to the
database.</param>
<param name="normal">Optional normal vector.  If this parameter is 
supplied then it must be a valid vector that is perpendicular to the
input geCurve, and this vector will become the normal vector of
the output pDbCurve.  If this parameter is not supplied, then this
function will compute the normal vector itself.</param>
<param name="tol">Optional input tolerance.</param>
<returns>Returns eOk if successful.</returns>
</member>
<member name="M:AcDbCurve.setFromAcGeCurve(AcGeCurve3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d*,AcGeTol!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbcurve.h" line="146">
<summary>
This function takes an AcGeCurve3d and sets this AcDbCurve to be
geometrically identical to the AcGeCurve3d.
</summary>
<param name="geCurve">Input reference to an AcGeCurve3d.</param>
<param name="normal">Optional normal vector.  If this parameter is 
supplied then it must be a valid vector that is perpendicular to the
input geCurve, and this vector will become the normal vector of
the output pDbCurve.  If this parameter is not supplied, then this
function will compute the normal vector itself.</param>
<param name="tol">Optional input tolerance.</param>
<returns>Returns eOk if successful.</returns>
</member>
<member name="T:AcGiLightTraits" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="49">
<summary>
Parent class for interfaces passed to AcDbLight objects in the
implementation of setAttributes(). The light first down-casts the
traits class to the specific type, specified earlier in the addLight()
call. It then sets specific light properties.

This class derives (indirectly) from AcGiDrawableTraits, as that is what
is passed into AcGiDrawable::setAttributes().

Lights on frozen layers will not be processed; their light will not
illuminate the model.
</summary>

<remarks>
A light passing it's properties to this class should not rely on any
default values.
</remarks>

</member>
<member name="M:AcGiLightTraits.setOn(System.Boolean)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="72">
<summary>
Turns the light on or off in the viewport or render. If the light
is off, the other properties here may simply be ignored. However,
lights that are turned off may still "draw" graphics for display
in the viewport.

Lights on frozen layers are not processed at all, so your light
object does not have to check that condition.
</summary>

<param name="on">
If true, the light is "turned on".
</param>
</member>
<member name="M:AcGiLightTraits.isOn" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="87">
<summary>
Light on/off state.
</summary>

<returns>
True if the light is on.
</returns>
</member>
<member name="T:AcGiShadowParameters" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="101">
<summary>
Container class for all shadow-related light properties.
</summary>

</member>
<member name="M:AcGiShadowParameters.setShadowsOn(System.Boolean)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="115">
<summary>
Turns shadow casting from this light on and off.
</summary>

<param name="on">
If true, this light casts shadows.
</param>
</member>
<member name="M:AcGiShadowParameters.shadowsOn" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="124">
<summary>
Does the light cast shadows?
</summary>

<returns>
True if the light casts shadows.
</returns>
</member>
<member name="T:AcGiShadowParameters.ShadowType" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="133">
<summary>
The method used to calculate shadows.
</summary>
</member>
<member name="F:kShadowsRayTraced" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="137">
<summary>
Shadows are calculated using a ray-trace algorithm.
</summary>
</member>
<member name="F:kShadowMaps" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="141">
<summary>
Shadow maps are created for each light.
</summary>
</member>
<member name="F:kAreaSampled" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="145">
<summary>
The area-sampled shadow algorithm models the effect of
extended light sources which typically exhibit penumbra.
</summary>
</member>
<member name="M:AcGiShadowParameters.setShadowType(AcGiShadowParameters.ShadowType)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="152">
<summary>
Sets the method used to calculate shadows cast by this light.
</summary>

<param name="typ">
One of: kShadowsRayTraced, kShadowMaps
</param>

<remarks>
When shadows are ray-traced, shadow map size and softness parameters
are ignored.
</remarks>
</member>
<member name="M:AcGiShadowParameters.shadowType" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="166">
<summary>
The method used to calculate shadows cast by this light.
</summary>

<returns>
One of: kShadowsRayTraced, kShadowMaps
</returns>
</member>
<member name="M:AcGiShadowParameters.setShadowMapSize(System.UInt16)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="175">
<summary>
Sets the shadow map size, in pixels. Larger numbers produce more 
accurate shadows, but require more memory and take longer to render.
</summary>

<param name="sz">
Valid values are 64, 128, 256, 512, 1024, 2048, and 4096.
</param>

<returns>
Returns true if a valid size is passed in.
</returns>

<remarks>
This value only applies if shadow type is kShadowMaps.
</remarks>
</member>
<member name="M:AcGiShadowParameters.shadowMapSize" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="193">
<summary>
The size of the shadow map, in pixels.
</summary>

<returns>
The size of the shadow map, in pixels.
Should be one of: 64, 128, 256, 512, 1024, 2048, or 4096.
</returns>

<remarks>
Only applies if shadow type is kShadowMaps.
</remarks>
</member>
<member name="M:AcGiShadowParameters.setShadowMapSoftness(System.Byte)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="207">
<summary>
Sets the softness (or fuzziness) of shadow-mapped shadows. The value
represents the number of pixels at the edge of the shadow that are 
blended into the underlying image.
</summary>

<param name="soft">
The value can range from 1 to 10.
</param>

<returns>
Returns true if a valid softness value is passed in.
</returns>

<remarks>
This value only applies if shadow type is kShadowMaps.
</remarks>
</member>
<member name="M:AcGiShadowParameters.shadowMapSoftness" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="226">
<summary>
The softness (or fuzziness) of the edge of the shadow. The value
represents the number of pixels at the edge of the shadow that are
blended into the underlying image.
</summary>

<returns>
The number of pixels at the edge of the shadow to blend.
</returns>

<remarks>
This value only applies if shadow type is kShadowMaps.
</remarks>
</member>
<member name="T:AcGiShadowParameters2" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="252">
<summary>
Container class for all shadow-related light properties including
extended light source information.
</summary>

</member>
<member name="M:AcGiShadowParameters2.setShadowSamples(System.UInt16)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="268">
<summary>
Sets the number of shadow rays to shoot for the light.  This 
controls the softness of sampled shadows.
</summary>

<param name="samples">
The number of shadow rays to shoot for the light.
</param>

<returns>
Returns true if a valid sample size is passed in.
</returns>

<remarks>
This value only applies if shadow type is kAreaSampled.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.shadowSamples" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="286">
<summary>
The number of shadow rays to shoot for the light.
</summary>

<returns>
The number of shadow rays to shoot for the light.
</returns>

<remarks>
Only applies if shadow type is kAreaSampled.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.setShapeVisibility(System.Boolean)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="299">
<summary>
Determines if the light shape is visible in the rendering.
</summary>

<param name="on">
If true, the light shape will be visible in the rendering.
</param>
</member>
<member name="M:AcGiShadowParameters2.shapeVisibility" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="308">
<summary>
Is the light visible in the rendering?
</summary>

<returns>
True if the light shape is visible in the rendering.
</returns>
</member>
<member name="T:AcGiShadowParameters2.ExtendedLightShape" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="317">
<summary>
The shape of the extended light source.
</summary>
</member>
<member name="F:kLinear" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="321">
<summary>
Linear lamps (communicated to mental ray as degenerate rectangles).
</summary>
</member>
<member name="F:kRectangle" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="325">
<summary>
Rectangular extended light source.
</summary>
</member>
<member name="F:kDisk" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="329">
<summary>
Disk-shaped extended light source.
</summary>
</member>
<member name="F:kCylinder" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="333">
<summary>
Cylindrical extended light source.
</summary>
</member>
<member name="F:kSphere" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="337">
<summary>
Spherical extended light source.
</summary>
</member>
<member name="M:AcGiShadowParameters2.setExtendedLightShape(AcGiShadowParameters2.ExtendedLightShape)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="343">
<summary>
Sets the shape of the extended light source.
</summary>

<param name="shape">
One of: kRectangle, kDisk, kCylinder, kSphere, kLinear, kWeb
</param>

<returns>
Returns true if a valid shape is passed in.
</returns>

<remarks>
This value only applies if shadow type is kAreaSampled.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.extendedLightShape" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="360">
<summary>
The shape of the extended light source.
</summary>

<returns>
One of: kRectangle, kDisk, kCylinder, kSphere, kLinear, kWeb
</returns>

<remarks>
Only applies if shadow type is kAreaSampled.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.setExtendedLightLength(System.Double)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="373">
<summary>
Sets the length of the extended light source.
</summary>

<param name="length">
The length of the extended light source.
</param>

<returns>
Returns true if a valid length is passed in.
</returns>

<remarks>
This value only applies if shadow type is kAreaSampled and
extended light source shape is kLinear, kRectangle or kCylinder.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.extendedLightLength" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="391">
<summary>
The length of the extended light source.
</summary>

<returns>
The length of the extended light source.
</returns>

<remarks>
Only applies if shadow type is kAreaSampled and extended 
light source shape is kLinear, kRectangle or kCylinder.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.setExtendedLightWidth(System.Double)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="405">
<summary>
Sets the width of the extended light source.
</summary>

<param name="width">
The width of the extended light source.
</param>

<returns>
Returns true if a valid width is passed in.
</returns>

<remarks>
This value only applies if shadow type is kAreaSampled and
extended light source shape is kRectangle.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.extendedLightWidth" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="423">
<summary>
The width of the extended light source.
</summary>

<returns>
The width of the extended light source.
</returns>

<remarks>
Only applies if shadow type is kAreaSampled and
extended light source shape is kRectangle.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.setExtendedLightRadius(System.Double)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="437">
<summary>
Sets the radius of the extended light source.
</summary>

<param name="radius">
The radius of the extended light source.
</param>

<returns>
Returns true if a valid radius is passed in.
</returns>

<remarks>
This value only applies if shadow type is kAreaSampled and
extended light source shape is kDisk, kCylinder or kSphere.
</remarks>
</member>
<member name="M:AcGiShadowParameters2.extendedLightRadius" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="455">
<summary>
The radius of the extended light source.
</summary>

<returns>
The radius of the extended light source.
</returns>

<remarks>
Only applies if shadow type is kAreaSampled and
extended light source shape is kDisk, kCylinder or kSphere.
</remarks>
</member>
<member name="T:AcGiLightAttenuation" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="482">
<summary>
Container class for light attenuation parameters.
</summary>

</member>
<member name="T:AcGiLightAttenuation.AttenuationType" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="496">
<summary>
The type of attenuation, or decay, for this light. This only applies
to point and spot lights. Distant lights always have no attenuation.
</summary>
</member>
<member name="F:kNone" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="501">
<summary>
No attenuation; emitted light has the same brightness (intensity)
regardless of the distance to the source.
</summary>
</member>
<member name="F:kInverseLinear" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="506">
<summary>
Sets attenuation to be the inverse of the linear distance from the
light. 
</summary>
</member>
<member name="F:kInverseSquare" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="511">
<summary>
Sets attenuation to be the inverse of the square of the distance
from the light. 
</summary>
</member>
<member name="M:AcGiLightAttenuation.setAttenuationType(AcGiLightAttenuation.AttenuationType)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="518">
<summary>
Sets the attenuation type for the light.
</summary>

<param name="typ">
One of: kNone, kInverseLinear, kInverseSquare
</param>
</member>
<member name="M:AcGiLightAttenuation.attenuationType" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="527">
<summary>
The attenuation type for the light.
</summary>

<returns>
One of: kNone, kInverseLinear, kInverseSquare
</returns>
</member>
<member name="M:AcGiLightAttenuation.setUseLimits(System.Boolean)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="536">
<summary>
Turns on and off application of any attenuation limits.
</summary>

<param name="on">
If true, both start and end limits will be used.
</param>
</member>
<member name="M:AcGiLightAttenuation.useLimits" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="545">
<summary>
Are the start and end limits used by this light?
</summary>

<returns>
True if start and end attenuation limits are used.
</returns>
</member>
<member name="M:AcGiLightAttenuation.setLimits(System.Double,System.Double)" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="554">
<summary>
Sets the distances (a range) from the light source where emitted light
affects the model.
</summary>

<param name="startlim">
The distance from the light source where light begins to affect the
model; objects closer than this are not affected by the light.
</param>
<param name="endlim">
The distance from the light source beyond which the light has no affect.
</param>

<remarks>
Start limit must be less than end limit, and both numbers must
greater than or equal to zero.
</remarks>
</member>
<member name="M:AcGiLightAttenuation.startLimit" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="573">
<summary>
The distance from the light source where light begins to affect the
model; objects closer than this are not affected by the light.
</summary>

<returns>
A distance.
</returns>
</member>
<member name="M:AcGiLightAttenuation.endLimit" decl="true" source="c:\objectarx\inc\acgilighttraits.h" line="583">
<summary>
The distance from the light source beyond which the light has no affect.
</summary>

<returns>
A distance.
</returns>
</member>
<member name="T:AcGiSkyParameters" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="603">
<summary>
Container class for all sky-related sun properties.
</summary>

</member>
<member name="M:AcGiSkyParameters.setIllumination(System.Boolean)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="617">
<summary>
Enables computation of skylight illumination.
</summary>

<param name="enable">
If true, skylight illumination will be computed.
</param>
</member>
<member name="M:AcGiSkyParameters.illumination" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="626">
<summary>
Should skylight illumination be calculated?
</summary>

<returns>
True if skylight illumination will be computed.
</returns>
</member>
<member name="M:AcGiSkyParameters.setIntensityFactor(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="635">
<summary>
Sets the intensity factor which determines the level of 
non-physical modulation of skylight.
</summary>

<param name="intensity">
The intensity factor for skylight.
</param>

<returns>
Returns true if a valid intensity factor is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.intensityFactor" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="649">
<summary>
The intensity factor which determines the level of 
non-physical modulation of skylight.
</summary>

<returns>
The instensity factor for skylight.
</returns>
</member>
<member name="M:AcGiSkyParameters.setHaze(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="659">
<summary>
Specifies turbidity or atmosphere.
</summary>

<param name="haze">
The turbidity or atmosphere value.
</param>

<returns>
Returns true if a valid atmosphere value is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.haze" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="672">
<summary>
The turbidity or atmosphere value.
</summary>

<returns>
The turbidity or atmosphere value.
</returns>
</member>
<member name="M:AcGiSkyParameters.setHorizonHeight(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="681">
<summary>
Sets the world-space height of the horizon plane.
</summary>

<param name="height">
The world-space height of the horizon plane.
</param>

<returns>
Returns true if a valid height is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.horizonHeight" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="694">
<summary>
The world-space height of the horizon plane.
</summary>

<returns>
The world-space height of the horizon plane.
</returns>
</member>
<member name="M:AcGiSkyParameters.setHorizonBlur(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="703">
<summary>
Sets the amount of blurring between ground plane and sky.
</summary>

<param name="blur">
The amount of blurring between ground plane and sky.
</param>

<returns>
Returns true if a valid blur amount is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.horizonBlur" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="716">
<summary>
The amount of blurring between ground plane and sky.
</summary>

<returns>
The amount of blurring between ground plane and sky.
</returns>
</member>
<member name="M:AcGiSkyParameters.setGroundColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="725">
<summary>
Sets the color of the ground plane.
</summary>

<param name="color">
The color of the ground plane. AcCmColor supports all color models
within AutoCAD, including color book colors.
</param>
</member>
<member name="M:AcGiSkyParameters.groundColor" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="735">
<summary>
The color of the ground plane.
</summary>

<returns>
The color of the ground plane.
</returns>
</member>
<member name="M:AcGiSkyParameters.setNightColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="744">
<summary>
Sets the color of the night sky.
</summary>

<param name="color">
The color of the night sky. AcCmColor supports all color models
within AutoCAD, including color book colors.
</param>
</member>
<member name="M:AcGiSkyParameters.nightColor" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="754">
<summary>
The color of the night sky.
</summary>

<returns>
The color of the night sky.
</returns>
</member>
<member name="M:AcGiSkyParameters.setAerialPerspective(System.Boolean)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="763">
<summary>
Specifies whether aerial perspective is applied.
</summary>

<param name="apply">
If true, aerial perspective is applied.
</param>
</member>
<member name="M:AcGiSkyParameters.aerialPerspective" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="772">
<summary>
Should aerial perspective be applied?
</summary>

<returns>
True if aerial perspective is applied.
</returns>
</member>
<member name="M:AcGiSkyParameters.setVisibilityDistance(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="781">
<summary>
Sets the distance at which 10% haze occlusion results.
</summary>

<param name="distance">
The distance at which 10% haze occlusion results.
</param>

<returns>
Returns true if a valid distance is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.visibilityDistance" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="794">
<summary>
The distance at which 10% haze occlusion results.
</summary>

<returns>
The distance at which 10% haze occlusion results.
</returns>
</member>
<member name="M:AcGiSkyParameters.setDiskScale(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="803">
<summary>
Sets the scale of the sun disk (1.0 = correct size).
</summary>

<param name="scale">
The scale of the sun disk (1.0 = correct size).
</param>

<returns>
Returns true if a valid scale is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.diskScale" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="816">
<summary>
The scale of the sun disk (1.0 = correct size).
</summary>

<returns>
The scale of the sun disk (1.0 = correct size).
</returns>
</member>
<member name="M:AcGiSkyParameters.setGlowIntensity(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="825">
<summary>
Sets the intensity of the sun glow.
</summary>

<param name="intensity">
The intensity of the sun glow.
</param>

<returns>
Returns true if a valid intensity value is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.glowIntensity" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="838">
<summary>
The intensity of the sun glow.
</summary>

<returns>
The intensity of the sun glow.
</returns>
</member>
<member name="M:AcGiSkyParameters.setDiskIntensity(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="847">
<summary>
Sets the intensity of the sun disk.
</summary>

<param name="intensity">
The intensity of the sun disk.
</param>

<returns>
Returns true if a valid intensity value is passed in.
</returns>
</member>
<member name="M:AcGiSkyParameters.diskIntensity" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="860">
<summary>
The intensity of the sun disk.
</summary>

<returns>
The intensity of the sun disk.
</returns>
</member>
<member name="M:AcGiSkyParameters.setSolarDiskSamples(System.UInt16)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="869">
<summary>
Sets the number of samples to take on the solar disk.
</summary>

<param name="samples">
The number of samples to take on the solar disk.
</param>

<returns>
Returns true if a valid sample size is passed in.
</returns>

<remarks>
This value only applies if shadow type is kAreaSampled.
</remarks>
</member>
<member name="M:AcGiSkyParameters.solarDiskSamples" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="886">
<summary>
The number of samples to take on the solar disk.
</summary>

<returns>
The number of samples to take on the solar disk.
</returns>

<remarks>
Only applies if shadow type is kAreaSampled.
</remarks>
</member>
<member name="M:AcGiSkyParameters.setSunDirection(AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="899">
<summary>
For internal use only.
</summary>
</member>
<member name="M:AcGiSkyParameters.sunDirection" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="904">
<summary>
Gets the direction (vector) of the sun's light rays.
</summary>

<returns>
The direction vector of sunlight, from the Sun to the model.
</returns>
</member>
<member name="M:AcGiSkyParameters.setRedBlueShift(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="913">
<summary>
Sets the red-blue shift on the sky.  This provides control on the "redness" of the
sky.  The default of 0.0 is physically accurate.  A minimum value of -1.0 will produce
a extremely blue sky, whereas the maximum value of 1.0 will produce an extremely
red sky.
</summary>
<returns>
Returns true if the input value is in the valid range of -1.0 to 1.0.  Returns
false otherwise.
</returns>
</member>
<member name="M:AcGiSkyParameters.redBlueShift" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="926">
<summary>
Returns the red-blue shift on the sky.  This provides control on the "redness" of the
sky.  The default of 0.0 is physically accurate.  A minimum value of -1.0 will produce
a extremely blue sky, whereas the maximum value of 1.0 will produce an extremely
red sky.
</summary>
<returns>
Returns the currently set value.
</returns>
</member>
<member name="M:AcGiSkyParameters.setSaturation(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="938">
<summary>
Artificially modifies the sky's saturation level.  The minimum value of 0.0 will produce
a extreme of black and white whereas the maximum value of 2.0 will produce highly boosted
saturation.
</summary>
<returns>
Returns true if the input value is in the valid range of 0.0 to 2.0.  Returns
false otherwise.
</returns>
</member>
<member name="M:AcGiSkyParameters.saturation" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="949">
<summary>
Returns the the sky's saturation level.  The minimum value of 0.0 will produce
a extreme of black and white whereas the maximum value of 2.0 will produce highly boosted
saturation.
</summary>
<returns>
Returns the currently set value.
</returns>
</member>
<member name="T:AcGiStandardLightTraits" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1031">
<summary>
This intermediate class represents a standard, or non-photometric light.
It defines properties common to all non-photometric lights.
</summary>

<remarks>
A light passing it's properties to this class shouldn't rely on any
default values.
</remarks>

</member>
<member name="M:AcGiStandardLightTraits.setIntensity(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1046">
<summary>
Sets the intensity of the light. Intensity must be greater than or equal
to zero. A value of 0.0 turns the light off.
</summary>

<param name="inten">
The intensity, or brightness, of the light. A value of 0.0 effectively
turns the light off.
</param>
</member>
<member name="M:AcGiStandardLightTraits.intensity" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1057">
<summary>
The intensity of the light.
</summary>

<returns>
Light intensity. The value will always be greater than or equal to zero.
</returns>
</member>
<member name="M:AcGiStandardLightTraits.setLightColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1066">
<summary>
Sets the color of the light.
</summary>

<param name="color">
The color of the emitted light. AcCmColor supports all color models
within AutoCAD, including color book colors.
</param>
</member>
<member name="M:AcGiStandardLightTraits.lightColor" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1076">
<summary>
The color of the light.
</summary>

<returns>
Returns the color of emitted light.
</returns>
</member>
<member name="M:AcGiStandardLightTraits.setShadowParameters(AcGiShadowParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1085">
<summary>
Sets the shadow parameters for this light.
</summary>

<param name="params">
The AcGiShadowParameters object that defines the way shadows are cast from this light.
</param>
</member>
<member name="M:AcGiStandardLightTraits.shadowParameters(AcGiShadowParameters*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1094">
<summary>
Provides access to shadow parameters for this light.
</summary>

<param name="params">
An AcGiShadowParameters object that will contain the current shadow 
properties of this light.
</param>
</member>
<member name="T:AcGiPointLightTraits" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1110">
<summary>
This class represents a point light source, whose light is emitted in all
directions.
</summary>

<remarks>
A light passing it's properties to this class shouldn't rely on any
default values.
</remarks>
</member>
<member name="M:AcGiPointLightTraits.setPosition(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1124">
<summary>
Sets the position of the light source. The coordinate space is defined
by the current context.
</summary>

<param name="pos">
The position of the light source.
</param>
</member>
<member name="M:AcGiPointLightTraits.position" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1134">
<summary>
The position of the light source, in the coordinate space of the
current context.
</summary>

<returns>
The position as an AcGePoint3d.
</returns>
</member>
<member name="M:AcGiPointLightTraits.lightAttenuation(AcGiLightAttenuation*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1144">
<summary>
Provides access to attenuation parameters for this light.
</summary>

<param name="atten">
An AcGiLightAttenuation object that will contain the current attenuation
parameters of this light. 
</param>
</member>
<member name="M:AcGiPointLightTraits.setAttenuation(AcGiLightAttenuation!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1154">
<summary>
Sets the attenuation parameters of this point light.
</summary>

<param name="atten">
The AcGiLightAttenuation object that defines the way light attenuates from this light.
</param>
</member>
<member name="T:AcGiPointLightTraits2" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1169">
<summary>
Extended point light interface allowing for photometric traits.
</summary>

</member>
<member name="M:AcGiPointLightTraits2.setPhysicalIntensity(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1179">
<summary>
Sets the physical intensity of the light in candela.
</summary>

<param name="physicalIntensity">
The physical intensity of the light in candela.
</param>
</member>
<member name="M:AcGiPointLightTraits2.physicalIntensity" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1188">
<summary>
The physical intensity of the light in candela.
</summary>

<returns>
The physical intensity of the light in candela.
</returns>
</member>
<member name="M:AcGiPointLightTraits2.setLampColor(AcGiColorRGB!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1197">
<summary>
Sets the corresponding RGB color for the light's lamp color.
</summary>

<param name="rgbColor">
Input RGB value for the light's lamp color.
</param>

<remarks>
This value can only be modified if lamp color type is kCustom.  If
lamp color type is set to kKelvin or kPreset, the RGB color is
predetermined; therefore, the RGB color cannot be modifed in
either case.
</remarks>
</member>
<member name="M:AcGiPointLightTraits2.lampColor(AcGiColorRGB*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1213">
<summary>
The RGB value for the light's lamp color.
</summary>

<param name="rgbColor">
Output RGB value for the light's lamp color.
</param>
</member>
<member name="M:AcGiPointLightTraits2.setShadowParameters(AcGiShadowParameters2!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1222">
<summary>
Sets the shadow parameters for this light.
</summary>

<param name="params">
The AcGiShadowParameters object that defines the way shadows are cast from this light.
</param>
</member>
<member name="M:AcGiPointLightTraits2.shadowParameters(AcGiShadowParameters2*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1231">
<summary>
Provides access to shadow parameters for this light.
</summary>

<param name="params">
An AcGiShadowParameters object that will contain the current shadow 
properties of this light.
</param>
</member>
<member name="M:AcGiPointLightTraits2.setHasTarget(System.Boolean)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1241">
<summary>
Indicates whether or not the light has a target.  If this is set to
false, the targetLocation() is effectively ignored.
</summary>

<param name="bHasTarget">
Indicates whether or not the light has a target.
</param>
</member>
<member name="M:AcGiPointLightTraits2.hasTarget" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1251">
<summary>
Indicates whether or not the light has a target.  If this is set to
false, the targetLocation() is effectively ignored.
</summary>

<returns>
Whether or not the light has a target.
</returns>
</member>
<member name="M:AcGiPointLightTraits2.setTargetLocation(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1261">
<summary>
Sets the location of the target point for the light. This, in
combination with the position, determine the direction that the 
light is "pointing". The coordinate space for this point is defined by
the current context.
</summary>

<param name="loc">
Location (point) of the light's target. It should not be exactly
the same as the position.
</param>
</member>
<member name="M:AcGiPointLightTraits2.targetLocation" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1274">
<summary>
The location (position) towards which the light is pointing, in 
the coordinate space of the current context.
</summary>

<returns>
The location as an AcGePoint3d.
</returns>
</member>
<member name="T:AcGiSpotLightTraits" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1290">
<summary>
This class represents a spot light source, whose light is emitted in a
specific direction, and has an associated "light cone".
</summary>

<remarks>
A light passing it's properties to this class shouldn't rely on any
default values.
</remarks>
</member>
<member name="M:AcGiSpotLightTraits.setPosition(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1304">
<summary>
Sets the position of the light source. The coordinate space is defined
by the current context.
</summary>

<param name="pos">
The position of the light source.
</param>
</member>
<member name="M:AcGiSpotLightTraits.position" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1314">
<summary>
The position of the light source, in the coordinate space of the
current context.
</summary>

<returns>
The position as an AcGePoint3d.
</returns>
</member>
<member name="M:AcGiSpotLightTraits.setTargetLocation(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1324">
<summary>
Sets the location of the target point for a spot light. This, in
combination with the position, determine the direction that the spot
light is "pointing". The coordinate space for this point is defined by
the current context.
</summary>

<param name="loc">
Location (point) of the spot light's target. It should not be exactly
the same as the position.
</param>
</member>
<member name="M:AcGiSpotLightTraits.targetLocation" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1337">
<summary>
The location (position) towards which the spot light is pointing, in 
the coordinate space of the current context.
</summary>

<returns>
The location as an AcGePoint3d.
</returns>
</member>
<member name="M:AcGiSpotLightTraits.setHotspotAndFalloff(System.Double,System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1347">
<summary>
Sets the hotspot and falloff angles.

The region between the hotspot and falloff angles is sometimes 
referred to as the rapid decay area.

The greater the difference between the hotspot and falloff angles,
the softer the edge of the light beam. If the hotspot and falloff 
angles are equal, the edge of the light beam is sharp. Both values
can range from 0 to 160 degrees. You cannot set the hotspot angle
to be greater than the falloff angle.
</summary>

<param name="hotspot">
The hotspot cone angle, in radians. Defines the brightest part of the
spot light beam. Must be smaller than or equal to the falloff.
</param>
<param name="falloff">
The falloff cone angle, in radians. Defines the full cone of light. This
is also known as the field angle. Must be larger than or equal to the
hotspot.
</param>

<returns>
Returns true if valid angles are passed in.
</returns>
</member>
<member name="M:AcGiSpotLightTraits.hotspot" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1375">
<summary>
The hotspot angle of this spot light.
</summary>

<returns>
The hotspot angle, in radians.
</returns>
</member>
<member name="M:AcGiSpotLightTraits.falloff" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1384">
<summary>
The falloff angle of this spot light.
</summary>

<returns>
The falloff angle, in radians.
</returns>
</member>
<member name="M:AcGiSpotLightTraits.lightAttenuation(AcGiLightAttenuation*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1393">
<summary>
Provides access to attenuation parameters for this light.
</summary>

<param name="atten">
An AcGiLightAttenuation object that will contain the current attenuation
parameters of this light. 
</param>
</member>
<member name="M:AcGiSpotLightTraits.setAttenuation(AcGiLightAttenuation!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1403">
<summary>
Sets the attenuation parameters of this spot light.
</summary>

<param name="atten">
The AcGiLightAttenuation object that defines the way light attenuates from this light.
</param>
</member>
<member name="T:AcGiSpotLightTraits2" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1417">
<summary>
Extended spot light interface allowing for photometric traits.
</summary>

</member>
<member name="M:AcGiSpotLightTraits2.setPhysicalIntensity(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1427">
<summary>
Sets the physical intensity of the light in candela.
</summary>

<param name="physicalIntensity">
The physical intensity of the light in candela.
</param>
</member>
<member name="M:AcGiSpotLightTraits2.physicalIntensity" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1436">
<summary>
The physical intensity of the light in candela.
</summary>

<returns>
The physical intensity of the light in candela.
</returns>
</member>
<member name="M:AcGiSpotLightTraits2.setLampColor(AcGiColorRGB!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1445">
<summary>
Sets the corresponding RGB color for the light's lamp color.
</summary>

<param name="rgbColor">
Input RGB value for the light's lamp color.
</param>

<remarks>
This value can only be modified if lamp color type is kCustom.  If
lamp color type is set to kKelvin or kPreset, the RGB color is
predetermined; therefore, the RGB color cannot be modifed in
either case.
</remarks>
</member>
<member name="M:AcGiSpotLightTraits2.lampColor(AcGiColorRGB*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1461">
<summary>
The RGB value for the light's lamp color.
</summary>

<param name="rgbColor">
Output RGB value for the light's lamp color.
</param>
</member>
<member name="M:AcGiSpotLightTraits2.setShadowParameters(AcGiShadowParameters2!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1470">
<summary>
Sets the shadow parameters for this light.
</summary>

<param name="params">
The AcGiShadowParameters object that defines the way shadows are cast from this light.
</param>
</member>
<member name="M:AcGiSpotLightTraits2.shadowParameters(AcGiShadowParameters2*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1479">
<summary>
Provides access to shadow parameters for this light.
</summary>

<param name="params">
An AcGiShadowParameters object that will contain the current shadow 
properties of this light.
</param>
</member>
<member name="T:AcGiDistantLightTraits" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1494">
<summary>
This class represents a distant light source, whose light is emitted in
parallel rays, with an infinite distance between the light source and
the model.
</summary>

<remarks>
A light passing it's properties to this class shouldn't rely on any
default values.
</remarks>
</member>
<member name="M:AcGiDistantLightTraits.setLightDirection(AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1509">
<summary>
Sets the direction the light rays travel in. This vector is in the
direction of the light rays (from light to model).
</summary>

<param name="vec">
The vector for the light rays.
</param>

<remarks>
This same interface is used for the sun; all of the other parameters
used to set the location of the sun, such as latitude, longitude, date,
and time, boil down to a vector, which is sent to the graphics system
through this method.
</remarks>
</member>
<member name="M:AcGiDistantLightTraits.lightDirection" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1526">
<summary>
The direction (vector) that the light rays travel in.
</summary>

<returns>
The direction, as a vector; the positive direction of this vector is
from light to model.
</returns>
</member>
<member name="M:AcGiDistantLightTraits.setIsSunlight(System.Boolean)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1536">
<summary>
Tells the system to render this distant light as sunlight. Some
rendering systems use special algorithms to render sunlight, as its
intensity is so high.
</summary>

<param name="isSunlight">
If true, this distant light may be rendered as sunlight.
</param>
</member>
<member name="M:AcGiDistantLightTraits.isSunlight" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1547">
<summary>
Does this distant light represent sunlight?
</summary>

<returns>
True if the light will be rendered as sunlight.
</returns>
</member>
<member name="T:AcGiDistantLightTraits2" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1561">
<summary>
Extended distant light interface allowing for photometric traits.
</summary>

</member>
<member name="M:AcGiDistantLightTraits2.setPhysicalIntensity(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1571">
<summary>
Sets the physical intensity of the light in candela.
</summary>

<param name="physicalIntensity">
The physical intensity of the light in candela.
</param>
</member>
<member name="M:AcGiDistantLightTraits2.physicalIntensity" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1580">
<summary>
The physical intensity of the light in candela.
</summary>

<returns>
The physical intensity of the light in candela.
</returns>
</member>
<member name="M:AcGiDistantLightTraits2.setLampColor(AcGiColorRGB!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1589">
<summary>
Sets the corresponding RGB color for the light's lamp color.
</summary>

<param name="rgbColor">
Input RGB value for the light's lamp color.
</param>

<remarks>
This value can only be modified if lamp color type is kCustom.  If
lamp color type is set to kKelvin or kPreset, the RGB color is
predetermined; therefore, the RGB color cannot be modifed in
either case.
</remarks>
</member>
<member name="M:AcGiDistantLightTraits2.lampColor(AcGiColorRGB*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1605">
<summary>
The RGB value for the light's lamp color.
</summary>

<param name="rgbColor">
Output RGB value for the light's lamp color.
</param>
</member>
<member name="M:AcGiDistantLightTraits2.setShadowParameters(AcGiShadowParameters2!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1614">
<summary>
Sets the shadow parameters for this light.
</summary>

<param name="params">
The AcGiShadowParameters object that defines the way shadows are cast from this light.
</param>
</member>
<member name="M:AcGiDistantLightTraits2.shadowParameters(AcGiShadowParameters2*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1623">
<summary>
Provides access to shadow parameters for this light.
</summary>

<param name="params">
An AcGiShadowParameters object that will contain the current shadow 
properties of this light.
</param>
</member>
<member name="M:AcGiDistantLightTraits2.setSkyParameters(AcGiSkyParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1633">
<summary>
Sets the sky parameters for this light.
</summary>

<param name="params">
An AcGiSkyParameters object that contains the sky properties of this light.
</param>
</member>
<member name="M:AcGiDistantLightTraits2.skyParameters(AcGiSkyParameters*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1642">
<summary>
Provides access to sky parameters for this light.
</summary>

<param name="params">
An AcGiSkyParameters object that contains the sky properties of this light.
</param>
</member>
<member name="T:AcGiWebLightTraits" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1657">
<summary>
Extended distant light interface allowing for photometric traits.
</summary>

</member>
<member name="T:AcGiWebLightTraits.WebFileType" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1666">
<summary>
Types of web files
</summary>
</member>
<member name="F:kTypeC" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1671">
<summary>
Type C web file
</summary>
</member>
<member name="F:kTypeB" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1676">
<summary>
Type B web file
</summary>
</member>
<member name="F:kTypeA" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1681">
<summary>
Type A web file
</summary>
</member>
<member name="T:AcGiWebLightTraits.WebSymmetry" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1687">
<summary>
Types of symmetry in the web file
</summary>
</member>
<member name="F:kNoSymmetry" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1692">
<summary>
No symmetry
</summary>
</member>
<member name="F:kSingleSymmetry" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1697">
<summary>
Symmetric about the XZ plane
</summary>
</member>
<member name="F:kDoubleSymmetry" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1702">
<summary>
Symmetric about the XZ and YZ planes
</summary>
</member>
<member name="F:kAxialSymmetry" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1707">
<summary>
Symmetric about the Z axis
</summary>
</member>
<member name="M:AcGiWebLightTraits.setWebFile(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1713">
<summary>
Sets the path to the file containing the light's goniometric
data (i.e. Illuminating Engineering Society or IES file).  Only 
applies to photometric lights.
</summary>

<param name="webFile">
Input ACHAR* const pointer to the light's IES file.
</param>
</member>
<member name="M:AcGiWebLightTraits.webFile(AcString*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1724">
<summary>
The path to the file containing the light's goniometric
data (i.e. Illuminating Engineering Society or IES file).
</summary>

<param name="webFile">
Output ACHAR* const pointer to the light's IES file.
</param>
</member>
<member name="M:AcGiWebLightTraits.setWebRotation(AcGeVector3d)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1734">
<summary>
Sets the rotation offset (specified in XYZ Euler angles) used to 
orient the goniometric data relative to the light orientation.
</summary>

<param name="rotation">
Input rotation offset specified in XYZ Euler angles.
</param>
</member>
<member name="M:AcGiWebLightTraits.webRotation(AcGeVector3d*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1744">
<summary>
The rotation offset (specified in XYZ Euler angles) used to 
orient the goniometric data relative to the light orientation.
</summary>

<param name="rotation">
Output rotation offset specified in XYZ Euler angles.
</param>
</member>
<member name="M:AcGiWebLightTraits.setWebFlux(System.Double)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1754">
<summary>
Explicitly set the flux value in lumens for the web light.
</summary>

<param name="flux">
The explicit flux value in lumens for the web light.
</param>
</member>
<member name="M:AcGiWebLightTraits.webFlux" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1763">
<summary>
Returns the flux value in lumens set for the web light.
</summary>

<returns>
The flux value set for the web light in lumens.
</returns>
</member>
<member name="M:AcGiWebLightTraits.setWebFileType(AcGiWebLightTraits.WebFileType)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1772">
<summary>
Sets the type of web file which was set by setWebFile().
</summary>

<param name="type">
The type of the web file specified by setWebFile().
</param>
</member>
<member name="M:AcGiWebLightTraits.webFileType" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1781">
<summary>
Returns the type of web file.
</summary>

<returns>
The type of web file.
</returns>
</member>
<member name="M:AcGiWebLightTraits.setWebSymmetry(AcGiWebLightTraits.WebSymmetry)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1790">
<summary>
Sets the symmetry of web file which was set by setWebFile().
</summary>

<param name="symmetry">
The symmetry of the web file specified by setWebFile().
</param>
</member>
<member name="M:AcGiWebLightTraits.webSymmetry" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1799">
<summary>
Returns the type of symmetry in the web file.
</summary>

<returns>
The type of symmetry in the web file.
</returns>
</member>
<member name="M:AcGiWebLightTraits.setWebHorzAng90to270(System.Boolean)" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1808">
<summary>
This method sets a flag to indicate that the IES file based web light is a bilaterally symmetric luminaire
that exhibits symmetry about the 90 to 270 degree plane.  In this case, in the corresponding IES file, 
the first value for the horizontal angle will be 90 degrees and the last value for the horizontal angle
will be 270 degrees.  This method can be used to establish the web light as having this characteristic, 
such that any special processing that should apply to this type of web light can be conditioned upon this
flag.  For more information, consult the following publication, which describes the IES file format 
standard in full:

IESNA LM-63-95,
IESNA Standard File Format for Electronic Transfer of Photometric Data,
By the IESNA (Illuminating Engineering Socety of North America) Computer Committee.
</summary>

<param name="symmetry">
The value of the horizontal angle 90 to 270 flag for the web file 
specified by setWebFile().
</param>
</member>
<member name="M:AcGiWebLightTraits.webHorzAng90to270" decl="false" source="c:\objectarx\inc\acgilighttraits.h" line="1828">
<summary>
Returns whether the horizontal angle 90 to 270 flag is set.
</summary>

<returns>
The setting of the horizontal angle 90 to 270 flag.
</returns>
</member>
<member name="T:AcGiSkyBackgroundTraits" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="116">
<summary>
This class enables sky background definitions to be elaborated to 
AcGi implementations.
</summary>

</member>
<member name="M:AcGiSkyBackgroundTraits.setSkyParameters(AcGiSkyParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="126">
<summary>
Sets the sky parameters for this light.
</summary>

<param name="params">
An AcGiSkyParameters object that contains the sky properties used
by this background.
</param>
</member>
<member name="M:AcGiSkyBackgroundTraits.skyParameters(AcGiSkyParameters*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="136">
<summary>
Provides access to sky parameters for this light.
</summary>

<param name="params">
An AcGiSkyParameters object that contains the sky properties used
by this background.
</param>
</member>
<member name="T:AcGiToneOperatorParameters" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="388">
<summary>
Container class for all tone operator parameters.
</summary>

</member>
<member name="M:AcGiToneOperatorParameters.setIsActive(System.Boolean)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="402">
<summary>
Indicates whether or not the tone operator is active.
</summary>

<param name="active">
If true, the tone operator is active.
</param>
</member>
<member name="M:AcGiToneOperatorParameters.isActive" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="411">
<summary>
Is the tone operator active?
</summary>

<returns>
True if the tone operator is active.
</returns>
</member>
<member name="M:AcGiToneOperatorParameters.setChromaticAdaptation(System.Boolean)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="420">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.chromaticAdaptation" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="425">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.setColorDifferentiation(System.Boolean)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="430">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.colorDifferentiation" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="435">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.setWhiteColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="440">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.whiteColor" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="445">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.setProcessBackground(System.Boolean)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="450">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.processBackground" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="455">
<summary>
Reserved for future use.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.setBrightness(System.Double)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="460">
<summary>
Sets the brightness for the tone operator.
</summary>

<param name="brightness">
The brightness for the tone operator.
</param>

<returns>
Returns true if a valid brightness value is passed in.
</returns>

<remarks>
This value only applies if the tone operator is active.
</remarks>
</member>
<member name="M:AcGiToneOperatorParameters.brightness" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="477">
<summary>
The brightness for the tone operator.
</summary>

<returns>
The brightness for the tone operator.
</returns>

<remarks>
Only applies if the tone operator is active.
</remarks>
</member>
<member name="M:AcGiToneOperatorParameters.setContrast(System.Double)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="490">
<summary>
Sets the contrast for the tone operator.
</summary>

<param name="contrast">
The contrast for the tone operator.
</param>

<returns>
Returns true if a valid contrast value is passed in.
</returns>

<remarks>
This value only applies if the tone operator is active.
</remarks>
</member>
<member name="M:AcGiToneOperatorParameters.contrast" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="507">
<summary>
The contrast for the tone operator.
</summary>

<returns>
The contrast for the tone operator.
</returns>

<remarks>
Only applies if the tone operator is active.
</remarks>
</member>
<member name="M:AcGiToneOperatorParameters.setMidTones(System.Double)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="520">
<summary>
Sets the mid tones for the tone operator.
</summary>

<param name="midTones">
The mid tones for the tone operator.
</param>

<returns>
Returns true if a valid midtones value is passed in.
</returns>

<remarks>
This value only applies if the tone operator is active.
</remarks>
</member>
<member name="M:AcGiToneOperatorParameters.midTones" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="537">
<summary>
The mid tones for the tone operator.
</summary>

<returns>
The mid tones for the tone operator.
</returns>

<remarks>
Only applies if the tone operator is active.
</remarks>
</member>
<member name="T:AcGiToneOperatorParameters.ExteriorDaylightMode" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="550">
<summary>
The exterior daylight mode.
</summary>
</member>
<member name="F:kDaylightOff" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="554">
<summary>
Off.
</summary>
</member>
<member name="F:kDaylightOn" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="558">
<summary>
On.
</summary>
</member>
<member name="F:kDaylightAuto" decl="false" source="c:\objectarx\inc\acgienvironment.h" line="562">
<summary>
Auto - key off of the Sun status.
</summary>
</member>
<member name="M:AcGiToneOperatorParameters.setExteriorDaylight(AcGiToneOperatorParameters.ExteriorDaylightMode)" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="568">
<summary>
Indicates whether or not exterior daylight is enabled.
</summary>

<param name="enable">
If true, exterior daylight is enabled.
</param>

<returns>
Returns true if a valid exterior daylight mode is passed in.
</returns>

<remarks>
This value only applies if the tone operator is active.
</remarks>
</member>
<member name="M:AcGiToneOperatorParameters.exteriorDaylight" decl="true" source="c:\objectarx\inc\acgienvironment.h" line="585">
<summary>
Is exterior daylight enabled?
</summary>

<returns>
True if exterior daylight is enabled.
</returns>

<remarks>
Only applies if the tone operator is active.
</remarks>
</member>
<member name="T:AcGiViewportTraits2" decl="false" source="c:\objectarx\inc\acgiviewport.h" line="50">
<summary>
Extended viewport interface allowing for tone operator traits.
</summary>

</member>
<member name="M:AcGiViewportTraits2.setToneOperatorParameters(AcGiToneOperatorParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgiviewport.h" line="59">
<summary>
Sets the tone operator parameters for this viewport.
</summary>

<param name="params">
An AcGiToneOperatorParameters object that contains the tone operator
properties of this viewport.
</param>
</member>
<member name="M:AcGiViewportTraits2.toneOperatorParameters(AcGiToneOperatorParameters*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgiviewport.h" line="69">
<summary>
Provides access to tone operator parameters for this viewport.
</summary>

<param name="params">
An AcGiToneOperatorParameters object that contains the tone operator
properties of this viewport.
</param>
</member>
<member name="T:AcGiFaceStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="33">
<summary> 
This class defines a collection of visual style properties
that can be applied to the faces of drawables.
</summary>

<remarks>
This class is deprecated, use AcGiVisualStyle traits*/setTraits* 
instead.
</remarks>
</member>
<member name="T:AcGiFaceStyle.LightingModel" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="48">
<summary>
Describes the type of lighting to apply to the faces of graphical
entities to which this face style is applied.
</summary>
</member>
<member name="F:kInvisible" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="53">
<summary>
Faces are not drawn.
</summary>
</member>
<member name="F:kConstant" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="57">
<summary>
Faces are drawn in a constant color.
</summary>
</member>
<member name="F:kPhong" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="61">
<summary>
Faces are drawn to approximate realistic direct lighting.
</summary>
</member>
<member name="F:kGooch" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="65">
<summary>
Gooch, A., Gooch, B., Shirley, P., and Cohen, E. 1998.  
A non-photorealistic lighting model for automatic technical
illustration.  In proceedings of the 25th Annual Conference
on Computer Graphics and Interactive Techniques SIGGRAPH '98.
ACM Press, New York, NY, 447-452.
</summary>
</member>
<member name="T:AcGiFaceStyle.LightingQuality" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="75">
<summary>
Describes the calculation method used for application of
lighting effects to faces.
</summary>
</member>
<member name="F:kNoLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="80">
<summary>
Apply no lighting calculations to the faces.
</summary>
</member>
<member name="F:kPerFaceLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="84">
<summary>
Each face has a color calculated based on its orientation to the 
light source(s) of the scene. 
</summary>
</member>
<member name="F:kPerVertexLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="89">
<summary>
Each vertex of a face has its color calculated based on its 
orientation to the light source(s) of the scene. 
</summary>
</member>
<member name="F:kPerPixelLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="94">
<summary>
Each pixel of a face has its color calculated based on its 
orientation to the light source(s) of the scene. 
</summary>
</member>
<member name="T:AcGiFaceStyle.FaceColorMode" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="101">
<summary>
Describes modifications that affect the color of a face before 
any lighting and shading (face style) calculations have been performed.
</summary>
</member>
<member name="F:kNoColorMode" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="106">
<summary>
No modifications are to be applied to the faces.
</summary>
</member>
<member name="F:kObjectColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="110">
<summary>
Apply the color of the drawable object to the faces of the object.
</summary>
</member>
<member name="F:kBackgroundColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="114">
<summary>
Apply the display background color to the faces.
</summary>
</member>
<member name="F:kMono" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="118">
<summary>
All faces are treated as having a specific color, resulting in a 
"monochromatic" effect.
</summary>
</member>
<member name="F:kTint" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="123">
<summary>
All faces have the Hue and Saturation values of their color mapped 
to the Hue and Saturation values of a specific color, resulting in
a "tinted" effect.  The luminance value remains unchanged.
</summary>
</member>
<member name="F:kDesaturate" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="129">
<summary>
Apply a desaturation percentage to the diffuse color of a material.
</summary>
</member>
<member name="T:AcGiFaceStyle.FaceModifier" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="135">
<summary>

</summary>
</member>
<member name="F:kNoFaceModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="139">
<summary>
Apply no face modifiers to the faces.
</summary>
</member>
<member name="F:kOpacity" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="143">
<summary>
Apply an opacity value to the faces.  If unset, faces are displayed with
full opacity.  If set, faces are displayed with a specified degree of
opacity from completely opaque to completely transparent.  Use the
associated API declared as follows to set the desired degree of opacity:
virtual void setOpacityLevel(double nLevel, bool bEnableModifier). 
</summary>
</member>
<member name="F:kSpecular" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="151">
<summary>
Apply a specular highlight (indicating reflection and shininess values)
to a material that is applied to the faces.  Use the associated API 
declared as follows to set the desired specular amount:
virtual void setSpecularAmount(double nAmount, bool bEnableModifier)
</summary>
</member>
<member name="M:AcGiFaceStyle.#ctor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="160">
<summary>
Default constructor.  Initializes members to reasonable default values.
</summary>
</member>
<member name="M:AcGiFaceStyle.#ctor(AcGiFaceStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="164">
<summary>
Copy constructor.  Copies the given face style into this face style.
</summary>
<param name="style">
Input AcGiFaceStyle. A constant reference to the face style which will be copied  
into this face style.
</param>
</member>
<member name="M:AcGiFaceStyle.Dispose" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="172">
<summary>
Destructor.  Performs any necessary cleanup of the face style.
</summary>
</member>
<member name="M:AcGiFaceStyle.set(AcGiFaceStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="177">
<summary>
Set method initializes this face style with the values of the 
given face style.
</summary>
<param name="style">
Input AcGiFaceStyle. A constant reference to the face style 
which will be copied into this face style.
</param>                               
</member>
<member name="M:AcGiFaceStyle.op_Assign(AcGiFaceStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="186">
<summary>
Assignment operator.  Copies the given face style into this face style.
</summary>
<param name="style">
Input AcGiFaceStyle. A constant reference to the face style 
which will be copied into this face style.
</param>                               
<returns>
Returns a reference to the face style into which the copy was made.
</returns>
</member>
<member name="M:AcGiFaceStyle.op_Equality(AcGiFaceStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="197">
<summary>
Comparison operator.  Compares the given face style with this face style.
</summary>
<param name="style">
Input AcGiFaceStyle. A constant reference to the face style 
which will be compared to this face style.
</param>                               
<returns>
Returns boolean value representing whether the given face style is equivalent
to this face style.
</returns>
</member>
<member name="M:AcGiFaceStyle.setLightingModel(AcGiFaceStyle.LightingModel)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="212">
<summary>
Sets the face lighting model to one of the range of values in the given
enumerator LightingModel.
</summary>
<param name="lightingModel">
Input LightingModel. The enumerated value to set as the selected lighting model.
</param>                               
</member>
<member name="M:AcGiFaceStyle.lightingModel" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="220">
<summary>
Returns the currently selected face lighting model.
</summary>
<returns>
Returns the currently selected face lighting model in the range of 
the LightingModel enumeration.
</returns>
</member>
<member name="M:AcGiFaceStyle.setLightingQuality(AcGiFaceStyle.LightingQuality)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="231">
<summary>
Sets the face lighting quality to one of the range of values in 
the given enumerator LightingQuality.
</summary>
<param name="lightingQuality">
Input LightingQuality. The enumerated value to set as the selected 
lighting quality.
</param>                               
</member>
<member name="M:AcGiFaceStyle.lightingQuality" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="240">
<summary>
Returns the currently selected face lighting quality.
</summary>
<returns>
Returns the currently selected face lighting quality in the range of 
the LightingQuality enumeration.
</returns>
</member>
<member name="M:AcGiFaceStyle.setFaceColorMode(AcGiFaceStyle.FaceColorMode)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="249">
<summary>
Sets the face color mode to one of the range of values in
the given enumerator FaceColorMode.
</summary>
<param name="mode">
Input FaceColorMode.  The enumerated value to set as the selected
face color mode.
</param>                               
</member>
<member name="M:AcGiFaceStyle.faceColorMode" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="258">
<summary>
Returns the currently selected face color mode.
</summary>
<returns>
Returns the currently selected face color mode in the range of
the FaceColorMode enumeration.
</returns>
</member>
<member name="M:AcGiFaceStyle.setFaceModifiers(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="267">
<summary>
Sets a collection of bitflags representing the face modifiers in effect.
</summary>
<param name="nModifiers">
Input Adesk::UInt32 containing the collection of bitwise flags defined
in the FaceModifier enumeration.
</param>                               
</member>
<member name="M:AcGiFaceStyle.setFaceModifierFlag(AcGiFaceStyle.FaceModifier,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="275">
<summary>
Enables or disables the given face modifier flag.
</summary>
<param name="flag">
Input FaceModifier enumeration value representing which flag to enable
or disable.
</param>                               
<param name="bEnable">
Input boolean representing whether to enable or disable the given flag.
</param>                               
</member>
<member name="M:AcGiFaceStyle.faceModifiers" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="286">
<summary>
Provides the collection of face modifier flags that are in effect.
</summary>
<returns>
Returns Adesk::UInt32 representing the collection of face modifier
flags that are in effect.
</returns>
</member>
<member name="M:AcGiFaceStyle.isFaceModifierFlagSet(AcGiFaceStyle.FaceModifier)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="294">
<summary>
Describes whether a particular face modifier flag is in effect.
</summary>
<param name="flag">
Input FaceModifier enumeration value representing the flag which
is to be checked to ascertain whether it is in effect.
</param>                               
<returns>
Returns boolean representing whether the given face modifier flag
is in effect.
</returns>
</member>
<member name="M:AcGiFaceStyle.setOpacityLevel(System.Double,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="307">
<summary>
Sets the level of opacity to be applied to faces.
</summary>
<param name="nLevel">
Input double representing the desired level of opacity in the range
from 0.0 to 1.0, with 1.0 representing full opacity (0% transparent) 
and 0.0 representing no opacity (100% transparent).
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the FaceModifier enumeration flag
enabling the opacity effect should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiFaceStyle.opacityLevel" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="321">
<summary>
Reports the level of opacity that is currently in effect, providing that
the FaceModifier enumeration flag representing opacity is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns double representing the opacity level.
</returns>
</member>
<member name="M:AcGiFaceStyle.setSpecularAmount(System.Double,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="331">
<summary>
Sets the specular highlight amount (indicating reflection and shininess 
values) of a material that is applied to the faces.  
</summary>
<param name="nAmount">
Input double representing the amount of specular highlight to apply to a 
material that is applied to the faces.
</param>                               
<param name="bEnableModifier">
Input bool representing whether to enable the specular face modifier.  If 
true, the flag is enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiFaceStyle.specularAmount" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="344">
<summary>
Reports the amount of specular highlight that will be applied to a material
that is applied to the faces.
</summary>
<returns>
Returns double representing the amount of specular highlight that will be
applied to a material that is applied to the faces.
</returns>
</member>
<member name="M:AcGiFaceStyle.setMonoColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="354">
<summary>
Apply a specified color that will be applied to produce a "monochromatic"
effect to the faces.
</summary>
<param name="color">
Input AcCmColor constant reference representing the color to
apply monochromatically to the faces.
</param>                               
<param name="bEnableMode">
Input bool representing whether to enable the mono color face modifier.  If 
true, the flag is enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiFaceStyle.monoColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="368">
<summary>
Reports the color value that will be applied to the faces to produce a 
"monochromatic" effect.
</summary>
<returns>
Returns AcCmColor constant reference representing the monochromatic color that 
will be applied to the faces.
</returns>
</member>
<member name="M:AcGiFaceStyle.monoColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="378">
<summary>
Reports the color value that will be applied to the faces to produce a 
"monochromatic" effect.     
</summary>
<returns>
Returns AcCmColor non-constant reference representing the monochromatic color that 
will be applied to the faces.
</returns>
</member>
<member name="T:AcGiEdgeStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="395">
<summary> 
This class defines a collection of visual style properties
that can be applied to the edges of drawables.
</summary>

<remarks>
This class is deprecated, use AcGiVisualStyle traits*/setTraits* 
instead.
</remarks>
</member>
<member name="T:AcGiEdgeStyle.EdgeModel" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="410">
<summary>
Describes the overall model to use for display of the edges of 
drawables.
</summary>
</member>
<member name="F:kNoEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="415">
<summary>
No edges will be displayed.
</summary>
</member>
<member name="F:kIsolines" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="419">
<summary>
Display Isolines, imaginary lines (edges), which represent the curvature
and shape of a drawable.
</summary>
</member>
<member name="F:kFacetEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="424">
<summary>
Display facet edges, the edges between adjoining facets.
</summary>
</member>
<member name="T:AcGiEdgeStyle.EdgeStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="430">
<summary>
Describes a collection of bitflags representing the combination of
edge styles that are in effect for display of edges.
</summary>
</member>
<member name="F:kNoEdgeStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="435">
<summary>
No styles will be applied to the edges.
</summary>
</member>
<member name="F:kVisible" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="439">
<summary>
Visible edges will be displayed.
</summary>
</member>
<member name="F:kSilhouette" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="443">
<summary>
Silhouette edges will be displayed.  A silhouette edge is an edge
connecting a back facing polygon with a front facing polygon.
</summary>
</member>
<member name="F:kObscured" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="448">
<summary>
Obscured edges will be displayed.  An obscured edge is that which
would not be normally be visible when in a shaded view.
</summary>
</member>
<member name="F:kIntersection" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="453">
<summary>
Intersection edges will be displayed.  An intersection edges is that
which is inferred from portions of different intersecting objects.
</summary>
</member>
<member name="T:AcGiEdgeStyle.EdgeModifier" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="460">
<summary>
Describes modifiers that can be applied to edges to give them various types
of effects.
</summary>
</member>
<member name="F:kNoEdgeModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="465">
<summary>
Apply no modifiers to the edges.
</summary>
</member>
<member name="F:kOverhang" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="469">
<summary>
Allow an edge to overhang its start and end points by a specified amount.
</summary>
</member>
<member name="F:kJitter" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="473">
<summary>
Apply a jitter effect to the edges.  The jitter effect is produced by drawing
extra lines adjacent to the original line, with a specific amount of 
perturbation away from the original line.
</summary>
</member>
<member name="F:kWidth" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="479">
<summary>
Apply a width &gt; 1 to the edges.
</summary>
</member>
<member name="F:kColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="483">
<summary>
Apply a color other than the drawable object color to the edges.
</summary>
</member>
<member name="F:kHaloGap" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="487">
<summary>
Apply a halo gap percentage to the edges of an object that is hidden
by another object, such that the specified gap is displayed between the
edges of the hidden object and the edges of the object which hides it.  
</summary>
</member>
<member name="F:kAlwaysOnTop" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="493">
<summary>
Force edges to be on top.  Edges will not participate in the Z-ordering
of the displayed drawables.
</summary>
</member>
<member name="F:kOpacity" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="498">
<summary>
Apply an opacity value to the edges.  If unset, edges are displayed with
full opacity.  If set, edges are displayed with a specified degree of
opacity from completely opaque to completely transparent.
</summary>
</member>
<member name="F:kWiggle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="504">
<summary>
Apply a wiggle effect to the edges.
</summary>
</member>
<member name="F:kTexture" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="508">
<summary>
Apply a Texture effect to the edges.
</summary>
</member>
<member name="T:AcGiEdgeStyle.JitterAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="514">
<summary>
Describes an enumeration representing the amount of "jitter" to apply to edges.
</summary>
</member>
<member name="F:kJitterLow" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="518">
<summary>
A small amount of perturbation will be applied to the edge.
</summary>
</member>
<member name="F:kJitterMedium" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="522">
<summary>
A medium amount of perturbation will be applied to the edge.
</summary>
</member>
<member name="F:kJitterHigh" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="526">
<summary>
A large amount of perturbation will be applied to the edge.
</summary>
</member>
<member name="T:AcGiEdgeStyle.WiggleAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="533">
<summary>
Describes an enumeration representing the amount of "wiggle" to apply to edges.
</summary>
</member>
<member name="F:kWiggleLow" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="537">
<summary>
A small amount of perturbation will be applied to the edge.
</summary>
</member>
<member name="F:kWiggleMedium" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="541">
<summary>
A medium amount of perturbation will be applied to the edge.
</summary>
</member>
<member name="F:kWiggleHigh" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="545">
<summary>
A large amount of perturbation will be applied to the edge.
</summary>
</member>
<member name="T:AcGiEdgeStyle.Linetype" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="551">
<summary>
Describes an enumeration representing the types of line patterns that can be 
displayed to represent an edge.
</summary>
</member>
<member name="F:kSolid" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="556">
<summary>
Display edges with a solid line pattern.
</summary>
</member>
<member name="F:kDashed" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="560">
<summary>
Display edges with a dashed line pattern.
</summary>
</member>
<member name="F:kDotted" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="564">
<summary>
Display edges with a dotted line pattern.
</summary>
</member>
<member name="F:kShortDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="568">
<summary>
Display edges with a short dashed line pattern.
</summary>
</member>
<member name="F:kMediumDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="572">
<summary>
Display edges with a medium dashed line pattern.
</summary>
</member>
<member name="F:kLongDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="576">
<summary>
Display edges with a long dashed line pattern.
</summary>
</member>
<member name="F:kDoubleShortDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="580">
<summary>
Display edges with a double short dashed line pattern.
</summary>
</member>
<member name="F:kDoubleMediumDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="584">
<summary>
Display edges with a double medium dashed line pattern.
</summary>
</member>
<member name="F:kDoubleLongDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="588">
<summary>
Display edges with a double long dashed line pattern.
</summary>
</member>
<member name="F:kMediumLongDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="592">
<summary>
Display edges with a medium long dashed line pattern.
</summary>
</member>
<member name="F:kSparseDot" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="596">
<summary>
Display edges with a sparse dotted line pattern.
</summary>
</member>
<member name="T:AcGiEdgeStyle.EdgeStyleApply" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="602">
<summary>
Describes an enumeration representing the type of geometry to
which the edge styles should be applied.
</summary>
</member>
<member name="F:kDefault" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="607">
<summary>
Apply the edge style to the geometry as designed.
</summary>
</member>
<member name="F:kAll" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="611">
<summary>
Apply the edge style to all geometry.
</summary>
</member>
<member name="M:AcGiEdgeStyle.#ctor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="617">
<summary>
Default constructor.  Initializes members to reasonable default values.
</summary>
</member>
<member name="M:AcGiEdgeStyle.#ctor(AcGiEdgeStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="621">
<summary>
Copy constructor.  Copies the given edge style into this edge style.
</summary>
<param name="style">
Input AcGiEdgeStyle. A constant reference to the edge style 
which will be copied into this edge style.
</param>
</member>
<member name="M:AcGiEdgeStyle.Dispose" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="629">
<summary>
Destructor.  Performs any necessary cleanup of the edge style.
</summary>
</member>
<member name="M:AcGiEdgeStyle.set(AcGiEdgeStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="635">
<summary>
Set method initializes this edge style with the values of the 
given edge style.
</summary>
<param name="style">
Input AcGiEdgeStyle. A constant reference to the edge style 
which will be copied into this edge style.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.op_Assign(AcGiEdgeStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="644">
<summary>
Assignment operator.  Copies the given edge style into this edge style.
</summary>
<param name="style">
Input AcGiEdgeStyle. A constant reference to the edge style 
which will be copied into this edge style.
</param>                               
<returns>
Returns a reference to the edge style into which the copy was made.
</returns>
</member>
<member name="M:AcGiEdgeStyle.op_Equality(AcGiEdgeStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="655">
<summary>
Comparison operator.  Compares the given edge style with this edge style.
</summary>
<param name="style">
Input AcGiEdgeStyle. A constant reference to the edge style 
which will be compared to this edge style.
</param>                               
<returns>
Returns boolean value representing whether the given edge style is equivalent
to this edge style.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setEdgeModel(AcGiEdgeStyle.EdgeModel)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="670">
<summary>
Sets the edge model to one of the range of values in the given
enumerator EdgeModel.
</summary>
<param name="model">
Input EdgeModel. The enumerated value to set as the selected edge model.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.edgeModel" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="678">
<summary>
Returns the currently selected edge model.
</summary>
<returns>
Returns the currently selected edge model in the range of 
the EdgeModel enumeration.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setEdgeStyles(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="687">
<summary>
Sets the edge style to a collection of values in the given
enumerator EdgeStyle.
</summary>
<param name="nStyles">
Input Adesk::UInt32. The bitflags to set as the collection 
of selected edge styles.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.setEdgeStyleFlag(AcGiEdgeStyle.EdgeStyle,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="696">
<summary>
Enables or disables the given edge styles flag.
</summary>
<param name="flag">
Input EdgeStyle enumeration value representing which flag to 
enable or disable.
</param>                               
<param name="bEnable">
Input boolean representing whether to enable or disable the given flag.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.edgeStyles" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="707">
<summary>
Reports the collection of edge style flags in effect.
</summary>
<returns>
Returns Adesk::UInt32 collection of edge style flags in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.isEdgeStyleFlagSet(AcGiEdgeStyle.EdgeStyle)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="714">
<summary>
Reports whether a given edge style flag is in effect.
</summary>
<param name="flag">
Input EdgeStyle enumeration representing which flag to check for enabled
status.
</param>                               
<returns>
Returns boolean true if the given flag is enabled, 
false if it is disabled.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setIntersectionColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="729">
<summary>
Sets the color of intersection edges.
</summary>
<param name="color">
Input AcCmColor const reference representing the color to set.
</param>
</member>
<member name="M:AcGiEdgeStyle.intersectionColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="736">
<summary>
Reports the current color of intersection edges.
</summary>
<returns>
Returns AcCmColor const reference to the current color of the 
intersection edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.intersectionColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="744">
<summary>
Reports the current color of intersection edges.
</summary>
<returns>
Returns AcCmColor non-const reference to the current color of the 
intersection edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setObscuredColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="753">
<summary>
Sets the color of obscured edges.
</summary>
<param name="color">
Input AcCmColor const reference representing the color to set.
</param>
</member>
<member name="M:AcGiEdgeStyle.obscuredColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="760">
<summary>
Reports the current color of obscured edges.
</summary>
<returns>
Returns AcCmColor const reference to the current color of the 
obscured edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.obscuredColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="768">
<summary>
Reports the current color of obscured edges.
</summary>
<returns>
Returns AcCmColor non-const reference to the current color of the 
obscured edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setObscuredLinetype(AcGiEdgeStyle.Linetype)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="777">
<summary>
Sets the linetype of obscured edges.
</summary>
<param name="ltype">
Input a member of the Linetype enumeration representing the 
linetype to set.
</param>
</member>
<member name="M:AcGiEdgeStyle.obscuredLinetype" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="785">
<summary>
Reports the current linetype of obscured edges.
</summary>
<returns>
Returns Linetype enumeration member representing the current 
linetype of the obscured edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setIntersectionLinetype(AcGiEdgeStyle.Linetype)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="794">
<summary>
Sets the linetype of intersection edges.
</summary>
<param name="ltype">
Input a member of the Linetype enumeration representing the 
linetype to set.
</param>
</member>
<member name="M:AcGiEdgeStyle.intersectionLinetype" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="802">
<summary>
Reports the current linetype of intersection edges.
</summary>
<returns>
Returns Linetype enumeration member representing the current 
linetype of the intersection edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setCreaseAngle(System.Double)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="811">
<summary>
Sets the angle threshold, above which a facet edge 
representing adjoining facets will be displayed.
</summary>
<param name="nAngle">
Input double threshold angle.
</param>
</member>
<member name="M:AcGiEdgeStyle.creaseAngle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="819">
<summary>
Reports the angle threshold, in degrees, above which a facet edge 
representing adjoining facets will be displayed.
</summary>
<returns>
Returns double threshold angle.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setEdgeModifiers(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="830">
<summary>
Sets a collection of bitflags representing the edge modifiers in effect.
</summary>
<param name="nModifiers">
Input Adesk::UInt32 containing the collection of bitwise flags defined
in the EdgeModifier enumeration.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.setEdgeModifierFlag(AcGiEdgeStyle.EdgeModifier,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="838">
<summary>
Enables or disables the given edge modifier flag.
</summary>
<param name="flag">
Input EdgeModifier enumeration value representing which flag to enable
or disable.
</param>                               
<param name="bEnable">
Input boolean representing whether to enable or disable the given flag.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.edgeModifiers" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="849">
<summary>
Provides the collection of edge modifier flags that are in effect.
</summary>
<returns>
Returns Adesk::UInt32 representing the collection of edge modifier
flags that are in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.isEdgeModifierFlagSet(AcGiEdgeStyle.EdgeModifier)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="857">
<summary>
Describes whether a particular edge modifier flag is in effect.
</summary>
<param name="flag">
Input EdgeModifier enumeration value representing the flag which
is to be checked to ascertain whether it is in effect.
</param>                               
<returns>
Returns boolean representing whether the given edge modifier flag
is in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setEdgeColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="872">
<summary>
Sets the color of edges.
</summary>
<param name="color">
Input AcCmColor const reference representing the color to set.
</param>
<param name="bEnableModifier">
Input boolean representing whether to enable 
</param>                               
</member>
<member name="M:AcGiEdgeStyle.edgeColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="882">
<summary>
Reports the current color of  edges.
</summary>
<returns>
Returns AcCmColor const reference to the current color of the edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.edgeColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="889">
<summary>
Reports the current color of edges.
</summary>
<returns>
Returns AcCmColor non-const reference to the current color of the edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setOpacityLevel(System.Double,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="897">
<summary>
Sets the level of opacity to be applied to edges.
</summary>
<param name="nLevel">
Input double representing the desired level of opacity in the range
from 0.0 to 1.0, with 1.0 representing full opacity (0% transparent) 
and 0.0 representing no opacity (100% transparent).
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the EdgeModifier enumeration flag
enabling the opacity effect should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.opacityLevel" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="911">
<summary>
Reports the level of opacity that is currently in effect, providing that
the EdgeModifier enumeration flag representing opacity is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns double representing the opacity level.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setEdgeWidth(System.Int32,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="921">
<summary>
Sets the edge width in pixels.
</summary>
<param name="nWidth">
Input int representing the desired width in pixels.
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the EdgeModifier enumeration flag
enabling the edge width should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.edgeWidth" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="933">
<summary>
Reports the edge width that is currently in effect, providing that
the EdgeModifier enumeration flag representing edge width is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns int representing the edge width in pixels.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setOverhangAmount(System.Int32,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="943">
<summary>
Sets the amount in pixels that edges should overhang their 
start and end points.  
</summary>
<param name="nAmount">
Input int representing the desired overhang amount in pixels.
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the EdgeModifier enumeration flag
enabling the edge width should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.overhangAmount" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="956">
<summary>
Reports the edge width that is currently in effect, providing that
the EdgeModifier enumeration flag representing edge overhang is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns int representing the edge overhang amount in pixels.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setJitterAmount(AcGiEdgeStyle.JitterAmount,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="966">
<summary>
Sets the amount of jitter effect, represented as a value of the 
JitterAmount enumeration, to be applied to jittered edges.
</summary>
<param name="amount">
Input int representing the desired overhang amount in pixels.
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the EdgeModifier enumeration flag
enabling the jittered effect should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.jitterAmount" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="980">
<summary>
Reports the jitter amount that is currently in effect, providing that
the EdgeModifier enumeration flag representing edge width is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns JitterAmount enumeration representing the jitter amount in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setWiggleAmount(AcGiEdgeStyle.WiggleAmount,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="990">
<summary>
Sets the amount of jitter effect, represented as a value of the 
JitterAmount enumeration, to be applied to jittered edges.
</summary>
<param name="amount">
Input int representing the desired overhang amount in pixels.
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the EdgeModifier enumeration flag
enabling the jittered effect should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.wiggleAmount" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1004">
<summary>
Reports the jitter amount that is currently in effect, providing that
the EdgeModifier enumeration flag representing edge width is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns JitterAmount enumeration representing the jitter amount in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setSilhouetteColor(AcCmColor!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1014">
<summary>
Sets the color of silhouette edges.
</summary>
<param name="color">
Input AcCmColor const reference representing the color to set.
</param>
</member>
<member name="M:AcGiEdgeStyle.silhouetteColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1021">
<summary>
Reports the current color of silhouette edges.
</summary>
<returns>
Returns AcCmColor const reference to the current color of the 
silhouette edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.silhouetteColor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1029">
<summary>
Reports the current color of silhouette edges.
</summary>
<returns>
Returns AcCmColor non-const reference to the current color of 
the silhouette edges.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setSilhouetteWidth(System.Int16)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1038">
<summary>
Sets the silhouette edge width in pixels.
</summary>
<param name="nWidth">
Input int representing the desired width in pixels.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.silhouetteWidth" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1045">
<summary>
Reports the silhouette edge width that is currently in effect, providing that
the EdgeModifier enumeration flag representing edge width is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns int representing the silhouette edge width in pixels.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setHaloGap(System.Int32,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1055">
<summary>
Sets the halo gap to apply.
</summary>
<param name="nHaloGap">
Input int from 0 to 100 representing the desired gap.
</param>                               
<param name="bEnableModifier">
Input boolean representing whether the EdgeModifier enumeration flag
enabling the halo gap should be enabled.  If true, the flag is
enabled.  If false, the flag's current value is retained.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.haloGap" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1067">
<summary>
Reports the halo gap that is currently in effect, providing that
the EdgeModifier enumeration flag representing halo gap is enabled, or that
would be in effect were the flag enabled.
</summary>
<returns>
Returns int from 0 to 100 representing the halo gap in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setIsolines(System.UInt16)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1077">
sysvar
<summary>
Sets the number of isolines to apply.
</summary>
<param name="nIsolines">
Input unsigned short between 0 and 2047.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.isolines" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1085">
<summary>
Reports the number of isolines that are currently in effect.
</summary>
<returns>
Returns int from 0 to 2047 representing the number of isolines in effect.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setHidePrecision(System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1093">
sysvar
<summary>
Sets the state of hide precision indicating whether hide precision 
should be enabled.
</summary>
<param name="bHidePrecision">
Input boolean representing whether hide precision should be enabled.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.hidePrecision" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1102">
<summary>
Reports whether hide precision is enabled.
</summary>
<returns>
Returns boolean representing whether hide precision is enabled.
</returns>
</member>
<member name="M:AcGiEdgeStyle.setEdgeStyleApply(AcGiEdgeStyle.EdgeStyleApply)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1110">
<summary>
Sets a hint indicating to what geometry the edge style should be 
applied.
</summary>
<param name="apply">
Input enum EdgeStyleApply the type of geometry to which the edge 
style applies.   NOTE: This API is unimplemented.
</param>                               
</member>
<member name="M:AcGiEdgeStyle.edgeStyleApply" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1119">
<summary>
Reports the type of geometry to which the edge style will be applied.
</summary>
<returns>
Returns enum EdgeStyleApply representing to which geometry the edge 
style will be applied.
</returns>
</member>
<member name="T:AcGiDisplayStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1135">
<summary> 
This class defines a collection of display properties
that can be applied to drawables.
</summary>

<remarks>
This class is deprecated, use AcGiVisualStyle traits*/setTraits* 
instead.
</remarks>
</member>
<member name="T:AcGiDisplayStyle.DisplaySettings" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1148">
<summary>
Describes combinations of display settings that can be enabled.
</summary>
</member>
<member name="F:kNone" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1152">
<summary>
No display settings are in effect
</summary>
</member>
<member name="F:kBackgrounds" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1156">
<summary>
Backgrounds are enabled
</summary>
</member>
<member name="F:kLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1160">
<summary>
Lighting is enabled
</summary>
</member>
<member name="F:kMaterials" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1164">
<summary>
Materials are enabled
</summary>
</member>
<member name="F:kTextures" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1168">
<summary>
Textures are enabled
</summary>
</member>
<member name="T:AcGiDisplayStyle.ShadowType" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1174">
<summary>
Describes the type of shadows in effect.
</summary>
</member>
<member name="F:kShadowsNone" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1178">
<summary>
No shadows are displayed.
</summary>
</member>
<member name="F:kShadowsGroundPlane" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1182">
<summary>
Ground plane shadows are displayed.
</summary>
</member>
<member name="F:kShadowsFull" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1186">
<summary>
Full shadows are displayed.
</summary>
</member>
<member name="F:kShadowsFullAndGround" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1190">
<summary>
Full shadows are displayed along with shadows on the ground plane.
</summary>
</member>
<member name="M:AcGiDisplayStyle.#ctor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1198">
<summary>
Default constructor.  Initializes members to reasonable default values.
</summary>
</member>
<member name="M:AcGiDisplayStyle.#ctor(AcGiDisplayStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1202">
<summary>
Copy constructor.  Copies the given display style into this display style.
</summary>
<param name="style">
Input AcGiDisplayStyle. A constant reference to the display style 
which will be copied into this display style.
</param>
</member>
<member name="M:AcGiDisplayStyle.Dispose" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1210">
<summary>
Destructor.  Performs any necessary cleanup of the display style.
</summary>
</member>
<member name="M:AcGiDisplayStyle.set(AcGiDisplayStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1215">
<summary>
Set method initializes this display style with the values of the 
given display style.
</summary>
<param name="style">
Input AcGiDisplayStyle. A constant reference to the display style 
which will be copied into this display style.
</param>                               
</member>
<member name="M:AcGiDisplayStyle.op_Assign(AcGiDisplayStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1224">
<summary>
Assignment operator.  Copies the given display style into this display style.
</summary>
<param name="style">
Input AcGiDisplayStyle. A constant reference to the display style 
which will be copied into this display style.
</param>                               
<returns>
Returns a reference to the display style into which the copy was made.
</returns>
</member>
<member name="M:AcGiDisplayStyle.op_Equality(AcGiDisplayStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1236">
<summary>
Comparison operator.  Compares the given display style with this display style.
</summary>
<param name="style">
Input AcGiDisplayStyle. A constant reference to the display style 
which will be compared to this display style.
</param>                               
<returns>
Returns boolean value representing whether the given display style is equivalent
to this display style.
</returns>
</member>
<member name="M:AcGiDisplayStyle.setDisplaySettings(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1251">
<summary>
Sets a collection of bitflags representing the display settings in effect.
</summary>
<param name="nSettings">
Input Adesk::UInt32 containing the collection of bitwise flags defined
in the DisplaySettings enumeration.
</param>                               
</member>
<member name="M:AcGiDisplayStyle.setDisplaySettingsFlag(AcGiDisplayStyle.DisplaySettings,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1259">
<summary>
Enables or disables the given display settings flag.
</summary>
<param name="flag">
Input DisplaySettings enumeration value representing which flag to enable
or disable.
</param>                               
<param name="bEnable">
Input boolean representing whether to enable or disable the given flag.
</param>                               
</member>
<member name="M:AcGiDisplayStyle.displaySettings" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1270">
<summary>
Provides the collection of display settings flags that are in effect.
</summary>
<returns>
Returns Adesk::UInt32 representing the collection of display settings
flags that are in effect.
</returns>
</member>
<member name="M:AcGiDisplayStyle.isDisplaySettingsFlagSet(AcGiDisplayStyle.DisplaySettings)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1278">
<summary>
Describes whether a particular display settings flag is in effect.
</summary>
<param name="flag">
Input DisplaySettings enumeration value representing the flag which
is to be checked to ascertain whether it is in effect.
</param>                               
<returns>
Returns boolean representing whether the given display settings flag
is in effect.
</returns>
</member>
<member name="M:AcGiDisplayStyle.setBrightness(System.Double)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1292">
<summary>
Sets the brightness value to apply.
</summary>
<param name="value">
Input double brightness level to apply.
</param>                               
</member>
<member name="M:AcGiDisplayStyle.brightness" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1299">
<summary>
Reports the brightness value that is currently in effect.
</summary>
<returns>
Returns double the brightness value that is currently in effect.
</returns>
</member>
<member name="M:AcGiDisplayStyle.setShadowType(AcGiDisplayStyle.ShadowType)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1307">
<summary>
Sets the shadow type to apply.
</summary>
<param name="type">
Input ShadowType entry to apply, from the ShadowType enumeration.
</param>                               
</member>
<member name="M:AcGiDisplayStyle.shadowType" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="1314">
<summary>
Reports the shadow type that is currently in effect.
</summary>
<returns>
Returns ShadowType the value from the ShadowType enumeration that 
is currently in effect.
</returns>
</member>
<member name="F:kInvalidProperty" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1336">
<summary>
Invalid property.
</summary>
</member>
<member name="F:kFaceLightingModel" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1344">
<summary>
See FaceLightingModel summary.
</summary>
</member>
<member name="F:kFaceLightingQuality" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1349">
<summary>
See FaceLightingQuality summary.
</summary>
</member>
<member name="F:kFaceColorMode" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1354">
<summary>
See FaceColorMode summary.
</summary>
</member>
<member name="F:kFaceModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1359">
<summary>
See FaceModifiers summary.
</summary>
</member>
<member name="F:kFaceOpacity" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1364">
<summary>
Double indicating the level of face opacity in the range from 
0.0 to 1.0, with 1.0 representing full opacity (0% transparent) 
and 0.0 representing no opacity (100% transparent).
</summary>
</member>
<member name="F:kFaceSpecular" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1371">
<summary>
Double representing the specular highlight amount (indicating 
reflection and shininess values) of the material that is applied 
to faces. 
</summary>
</member>
<member name="F:kFaceMonoColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1378">
<summary>
AcCmColor representing the color applied to produce a "monochromatic" effect on faces.
</summary>
</member>
<member name="F:kEdgeModel" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1386">
<summary>
See EdgeModel summary.
</summary>
</member>
<member name="F:kEdgeStyles" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1391">
<summary>
See EdgeStyles summary.
</summary>
</member>
<member name="F:kEdgeIntersectionColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1396">
<summary>
AcCmColor representing the color applied to intersection edges.
</summary>
</member>
<member name="F:kEdgeObscuredColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1401">
<summary>
AcCmColor representing the color applied to obscured edges.
</summary>
</member>
<member name="F:kEdgeObscuredLinePattern" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1406">
<summary>
EdgeLinePattern applied to obscured edges.
See EdgeLinePattern summary.
</summary>
</member>
<member name="F:kEdgeIntersectionLinePattern" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1412">
<summary>
EdgeLinePattern applied to intersection edges.
See EdgeLinePattern summary.
</summary>
</member>
<member name="F:kEdgeCreaseAngle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1418">
<summary>
Double, in degrees, indicating the angle threshold above which 
facet edges between adjoining facets will be displayed.
</summary>
</member>
<member name="F:kEdgeModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1424">
<summary>
See EdgeModifier summary.
</summary>
</member>
<member name="F:kEdgeColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1429">
<summary>
AcCmColor representing the color applied to edges.
</summary>
</member>
<member name="F:kEdgeOpacity" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1434">
<summary>
Double indicating the level of edge opacity in the range from 
0.0 to 1.0, with 1.0 representing full opacity (0% transparent) 
and 0.0 representing no opacity (100% transparent).
</summary>
</member>
<member name="F:kEdgeWidth" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1441">
<summary>
Int representing edge width in pixels.
</summary>
</member>
<member name="F:kEdgeOverhang" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1446">
<summary>
Int representing the amount, in pixels, that edges should overhang
their start and end points.
</summary>
</member>
<member name="F:kEdgeJitterAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1452">
<summary>
See EdgeJitterAmount summary.
</summary>
</member>
<member name="F:kEdgeSilhouetteColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1457">
<summary>
AcCmColor representing the color applied to silhouette edges.
</summary>
</member>
<member name="F:kEdgeSilhouetteWidth" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1462">
<summary>
Short representing silhouette edge width in pixels.
</summary>
</member>
<member name="F:kEdgeHaloGap" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1467">
<summary>
Int from 0 to 100 representing the halo gap.
</summary>
</member>
<member name="F:kEdgeIsolines" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1472">
<summary>
Unsigned short, between 0 and 2047, indicating the number of 
isolines to display for curved surfaces.
</summary>
</member>
<member name="F:kEdgeHidePrecision" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1478">
<summary>
Bool indicating hide precision enabled. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kDisplayStyles" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1487">
<summary>
See DisplayStyles summary.
</summary>
</member>
<member name="F:kDisplayBrightness" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1492">
<summary>
Double indicating brightness.
</summary>
</member>
<member name="F:kDisplayShadowType" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1497">
<summary>
See DisplayShadowType summary.
</summary>
</member>
<member name="F:kUseDrawOrder" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1502">
<summary>
Bool indicating use DB display draw order. True if enabled,
false otherwise. When true Z depth is ignored for draw order.
</summary>
</member>
<member name="F:kViewportTransparency" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1508">
<summary>
Bool indicating if viewport transparency is enabled.  True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kLightingEnabled" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1514">
<summary>
Bool indicating if lighting is enabled. True if enabled, false
otherwise.
</summary>
</member>
<member name="F:kPosterizeEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1520">
<summary>
Bool indicating use Posterize global effect. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kMonoEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1526">
<summary>
Bool indicating use Mono global effect. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kBlurEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1532">
<summary>
Bool indicating use Blur global effect. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kPencilEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1538">
<summary>
Bool indicating use Pencil global effect. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kBloomEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1544">
<summary>
Bool indicating use Bloom global effect. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kPastelEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1550">
<summary>
Bool indicating use Pastel global effect. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kBlurAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1556">
<summary>
Int indicating blur amount. Range [0.0f, 5.0f].
</summary>
</member>
<member name="F:kPencilAngle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1561">
<summary>
Float indicating the angle para of pencil effect. Range [0.0f, 360.0f].
</summary>
</member>
<member name="F:kPencilScale" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1566">
<summary>
Int indicating the scale para of pencil effect. Range [0.0f, 3.0f].
</summary>
</member>
<member name="F:kPencilPattern" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1571">
<summary>
Int indicating the pattern para of pencil effect. Range [0, 3].
</summary>
</member>
<member name="F:kPencilColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1576">
<summary>
AcCmColor indicating the color para of pencil effect.
</summary>
</member>
<member name="F:kBloomThreshold" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1581">
<summary>
Float indicating the bright threshold para of bloom effect. Range [0.0f, INF].
</summary>
</member>
<member name="F:kBloomRadius" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1586">
<summary>
Float indicating the radius para of bloom effect. Range [1.0f, 5.0f].
</summary>
</member>
<member name="F:kTintColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1591">
<summary>
AcCmColor indicating the tint color para.
</summary>
</member>
<member name="F:kFaceAdjustment" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1596">
<summary>
Bool indicating the contrast/brightness/power functions are applied
false otherwise.
</summary>
</member>
<member name="F:kPostContrast" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1602">
<summary>
Adjust overall contrast of image, higher giving more contrast.
</summary>
</member>
<member name="F:kPostBrightness" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1607">
<summary>
Adjust overall brightness of image, higher making it brighter. 
</summary>
</member>
<member name="F:kPostPower" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1612">
<summary>
Change the power response curve. For example, gamma correction
is a setting of about 0.4. However, this control is meant more
as a way to control the appearance of the mid-tones: a lower number
brightens the midtones more.
</summary>
</member>
<member name="F:kTintEffect" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1620">
<summary>
Bool indicating the tint color is used. True if enabled,
false otherwise.
</summary>
</member>
<member name="F:kBloomIntensity" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1626">
<summary>
Float indicating the intensity of bloom effect. Range [0.0f, INF].
</summary>
</member>
<member name="F:kColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1631">
<summary>
AcCmColor overrides the color of drawables
</summary>
</member>
<member name="F:kTransparency" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1636">
<summary>
Float overrides the transparency of drawables. Range [0.0f, INF].
</summary>
</member>
<member name="F:kEdgeWiggleAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1641">
<summary>
Int indicating the amount of wiggle.
</summary>
</member>
<member name="F:kEdgeTexturePath" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1646">
<summary>
String overrides the edge texture path of drawables.
</summary>
</member>
<member name="F:kDepthOfField" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1651">
<summary>
Bool. Camera Effect. Keep objects in focus whose distance from the camera is within
the Focus Width around the Focus Distance.
</summary>
</member>
<member name="F:kFocusDistance" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1657">
<summary>
Float specifies the distance from the camera to focus on.
</summary>
</member>
<member name="F:kFocusWidth" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1662">
<summary>
Float specifies the distance from the focus distance to keep in focus.
</summary>
</member>
<member name="F:kPropertyCount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1667">
<summary>
The number of visual style properties
</summary>
</member>
<member name="F:kPropertyCountPre2013" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1673">
<summary>
The number of visual style properties for Pre-2013 drawing formats
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.Property" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1332">
<summary>
Describes the properties that can be set/get on a visual style.
</summary>
</member>
<member name="F:kInvisible" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1689">
<summary>
Faces are not drawn.
</summary>
</member>
<member name="F:kConstant" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1693">
<summary>
Faces are drawn in a constant color.
</summary>
</member>
<member name="F:kPhong" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1697">
<summary>
Faces are drawn to approximate realistic direct lighting.
</summary>
</member>
<member name="F:kGooch" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1701">
<summary>
Gooch, A., Gooch, B., Shirley, P., and Cohen, E. 1998.  
A non-photorealistic lighting model for automatic technical
illustration.  In proceedings of the 25th Annual Conference
on Computer Graphics and Interactive Techniques SIGGRAPH '98.
ACM Press, New York, NY, 447-452.
</summary>
</member>
<member name="F:kZebra" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1710">
<summary>
Faces are drawn in zebra stripes for surface analysis.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.FaceLightingModel" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1685">
<summary>
Describes the lighting model to apply to the faces of drawables.
</summary>
</member>
<member name="F:kNoLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1721">
<summary>
Apply no lighting calculations to the faces.
</summary>
</member>
<member name="F:kPerFaceLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1725">
<summary>
Each face has a color calculated based on its orientation to the 
light source(s) of the scene. 
</summary>
</member>
<member name="F:kPerVertexLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1730">
<summary>
Each vertex of a face has its color calculated based on its 
orientation to the light source(s) of the scene. 
</summary>
</member>
<member name="F:kPerPixelLighting" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1735">
<summary>
Each pixel of a face has its color calculated based on its 
orientation to the light source(s) of the scene. 
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.FaceLightingQuality" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1716">
<summary>
Describes the calculation method used for application of
lighting effects to faces.
</summary>
</member>
<member name="F:kNoColorMode" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1747">
<summary>
No modifications are to be applied to the faces.
</summary>
</member>
<member name="F:kObjectColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1751">
<summary>
Apply the color of the drawable to the faces.
</summary>
</member>
<member name="F:kBackgroundColor" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1755">
<summary>
Apply the display background color to the faces.
</summary>
</member>
<member name="F:kMono" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1759">
<summary>
All faces are treated as having a specific color, resulting in a 
"monochromatic" effect.
</summary>
</member>
<member name="F:kTint" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1764">
<summary>
All faces have the hue and saturation values of their color mapped 
to the hue and saturation values of a specific color, resulting in
a "tinted" effect.  The luminance value remains unchanged.
</summary>
</member>
<member name="F:kDesaturate" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1770">
<summary>
Apply a desaturation percentage to the diffuse color of a material.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.FaceColorMode" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1742">
<summary>
Describes modifications that affect the color of a face before 
any lighting and shading calculations have been performed.
</summary>
</member>
<member name="F:kNoFaceModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1781">
<summary>
Apply no face modifiers to the faces.
</summary>
</member>
<member name="F:kFaceOpacityFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1785">
<summary>
Apply an opacity value to the faces.  If unset, faces are displayed with
full opacity.  If set, faces are displayed with a specified degree of
opacity from completely opaque to completely transparent.   
</summary>
</member>
<member name="F:kSpecularFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1791">
<summary>
Apply a specular highlight (indicating reflection and shininess values)
to a material that is applied to the faces.  
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.FaceModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1776">
<summary>
Bitfield that describes modifications to faces made before any
lighting and shading calculations have been performed.
</summary>
</member>
<member name="F:kNoEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1806">
<summary>
No edges will be displayed.
</summary>
</member>
<member name="F:kIsolines" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1810">
<summary>
Display isolines, imaginary lines (edges) which represent the curvature
and shape of a drawable.
</summary>
</member>
<member name="F:kFacetEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1815">
<summary>
Display facet edges, the edges between adjoining facets.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.EdgeModel" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1802">
<summary>
Describes the model to use as a source of edges.
</summary>
</member>
<member name="F:kNoEdgeStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1825">
<summary>
No edges styles will be displayed
</summary>
</member>
<member name="F:kVisibleFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1829">
<summary>
Visible edges will be displayed.
</summary>
</member>
<member name="F:kSilhouetteFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1833">
<summary>
Silhouette edges will be displayed.  A silhouette edge is an edge
connecting a back facing polygon with a front facing polygon.
</summary>
</member>
<member name="F:kObscuredFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1838">
<summary>
Obscured edges will be displayed.  An obscured edge is that which
would not be normally be visible when in a shaded view.
</summary>
</member>
<member name="F:kIntersectionFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1843">
<summary>
Intersection edges will be displayed.  An intersection edges is that
which is inferred from intersecting facets.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.EdgeStyles" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1821">
<summary>
Bitfield which describes the combination of edge styles to display.
</summary>
</member>
<member name="F:kNoEdgeModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1854">
<summary>
Apply no modifiers to the edges.
</summary>
</member>
<member name="F:kEdgeOverhangFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1858">
<summary>
Allow an edge to overhang its start and end points by a specified amount.
</summary>
</member>
<member name="F:kEdgeJitterFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1862">
<summary>
Apply a jitter effect to the edges.  The jitter effect is produced by drawing
extra lines adjacent to the original line, with a specific amount of 
perturbation away from the original line.
</summary>
</member>
<member name="F:kEdgeWidthFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1868">
<summary>
Apply a width &gt; 1 to the edges.
</summary>
</member>
<member name="F:kEdgeColorFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1872">
<summary>
Apply a color other than the drawable object color to the edges.
</summary>
</member>
<member name="F:kEdgeHaloGapFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1876">
<summary>
Apply a halo gap percentage to the edges of an object that is hidden
by another object, such that the specified gap is displayed between the
edges of the hidden object and the edges of the object which hides it.  
</summary>
</member>
<member name="F:kAlwaysOnTopFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1882">
<summary>
Force edges to be on top.  Edges will not participate in the Z-ordering
of the displayed drawables.
</summary>
</member>
<member name="F:kEdgeOpacityFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1887">
<summary>
Apply an opacity value to the edges.  If unset, edges are displayed with
full opacity.  If set, edges are displayed with a specified degree of
opacity from completely opaque to completely transparent.
</summary>
</member>
<member name="F:kEdgeWiggleFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1893">
<summary>
Apply a wiggle effect to the edges.  The wiggle effect is produced by drawing
extra lines adjacent to the original line, with a specific amount of 
perturbation away from the original line.
</summary>
</member>
<member name="F:kEdgeTextureFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1899">
<summary>
Apply a texture effect to the edges.  The texture effect is produced by drawing
texure on the original line.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.EdgeModifiers" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1850">
<summary>
Bitfield which describes the combination of modifiers to apply to displayed edges.
</summary>
</member>
<member name="F:kJitterLow" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1910">
<summary>
A small amount of perturbation will be applied to edges.
</summary>
</member>
<member name="F:kJitterMedium" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1914">
<summary>
A medium amount of perturbation will be applied to edges.
</summary>
</member>
<member name="F:kJitterHigh" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1918">
<summary>
A large amount of perturbation will be applied to edges.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.EdgeJitterAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1906">
<summary>
Describes the amount of jitter effect to apply to edges.
</summary>
</member>
<member name="F:kWiggleLow" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1929">
<summary>
A small amount of perturbation will be applied to edges.
</summary>
</member>
<member name="F:kWiggleMedium" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1933">
<summary>
A medium amount of perturbation will be applied to edges.
</summary>
</member>
<member name="F:kWiggleHigh" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1937">
<summary>
A large amount of perturbation will be applied to edges.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.EdgeWiggleAmount" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1925">
<summary>
Describes the amount of jitter effect to apply to edges.
</summary>
</member>
<member name="F:kSolid" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1947">
<summary>
Display edges with a solid line pattern.
</summary>
</member>
<member name="F:kDashedLine" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1951">
<summary>
Display edges with a dashed line pattern.
</summary>
</member>
<member name="F:kDotted" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1955">
<summary>
Display edges with a dotted line pattern.
</summary>
</member>
<member name="F:kShortDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1959">
<summary>
Display edges with a short dashed line pattern.
</summary>
</member>
<member name="F:kMediumDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1963">
<summary>
Display edges with a medium dashed line pattern.
</summary>
</member>
<member name="F:kLongDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1967">
<summary>
Display edges with a long dashed line pattern.
</summary>
</member>
<member name="F:kDoubleShortDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1971">
<summary>
Display edges with a double short dashed line pattern.
</summary>
</member>
<member name="F:kDoubleMediumDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1975">
<summary>
Display edges with a double medium dashed line pattern.
</summary>
</member>
<member name="F:kDoubleLongDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1979">
<summary>
Display edges with a double long dashed line pattern.
</summary>
</member>
<member name="F:kMediumLongDash" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1983">
<summary>
Display edges with a medium long dashed line pattern.
</summary>
</member>
<member name="F:kSparseDot" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1987">
<summary>
Display edges with a sparse dotted line pattern.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.EdgeLinePattern" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1943">
<summary>
Describes the raster-based line patterns to apply to edges.
</summary>
</member>
<member name="F:kNoDisplayStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2001">
<summary>
No display settings are enabled.
</summary>
</member>
<member name="F:kBackgroundsFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2005">
<summary>
Backgrounds are displayed.
</summary>
</member>
<member name="F:kLightingFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2009">
<summary>
Lighting is displayed.
</summary>
</member>
<member name="F:kMaterialsFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2013">
<summary>
Materials are displayed.
</summary>
</member>
<member name="F:kTexturesFlag" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2017">
<summary>
Textures are displayed.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.DisplayStyles" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="1997">
<summary>
Bitfield which describes the combination of enabled display settings.
</summary>
</member>
<member name="F:kShadowsNone" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2027">
<summary>
No shadows are displayed.
</summary>
</member>
<member name="F:kShadowsGroundPlane" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2031">
<summary>
Ground plane shadows are displayed.
</summary>
</member>
<member name="F:kShadowsFull" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2035">
<summary>
Full shadows are displayed.
</summary>
</member>
<member name="F:kShadowsFullAndGround" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2039">
<summary>
Full and ground plane shadows are displayed.
</summary>
</member>
<member name="T:AcGiVisualStyleProperties.DisplayShadowType" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2023">
<summary>
Describes the type of shadow to enable.
</summary>
</member>
<member name="F:kInherit" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2057">
<summary>
Use the last property value specified.  NOTE: Reserved for future 
use.  Specifying this currently will be treated the same as kSet.
</summary>
</member>
<member name="F:kSet" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2063">
<summary>
Replace the last property value with the one specified.
</summary>
</member>
<member name="F:kDisable" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2068">
<summary>
Disable the specified bits in the property bitmask.
</summary>
</member>
<member name="F:kEnable" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2073">
<summary>
Enable the specified bits in the property bitmask.
</summary>
</member>
<member name="T:AcGiVisualStyleOperations.Operation" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2051">
<summary>
Describes what kind of operation to perform when setting a visual 
</summary>
</member>
<member name="T:AcGiVisualStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2083">
<summary> 
This class defines the collection of visual properties that can be 
applied to drawables.
</summary>

<remarks>

</remarks>
</member>
<member name="T:AcGiVisualStyle.Type" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2102">
<summary>
Describes the visual style type, based on multiple property settings.
</summary>
</member>
<member name="F:kFlat" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2107">
<summary>
Flat shaded visual style.
</summary>
</member>
<member name="F:kFlatWithEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2111">
<summary>
Flat shaded visual style with edges displayed.
</summary>
</member>
<member name="F:kGouraud" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2115">
<summary>
Gouraud shaded visual style.
</summary>
</member>
<member name="F:kGouraudWithEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2119">
<summary>
Gouraud shaded visual style with edges displayed.
</summary>
</member>
<member name="F:k2DWireframe" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2123">
<summary>
2D wireframe visual style (using 2D graphics system).
</summary>
</member>
<member name="F:k3DWireframe" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2127">
<summary>
3D wireframe visual style (using 3D graphics system).
</summary>
</member>
<member name="F:kHidden" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2131">
<summary>
Hidden visual style.
</summary>
</member>
<member name="F:kBasic" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2136">
<summary>
Basic default visual style.
</summary>
</member>
<member name="F:kRealistic" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2140">
<summary>
Phong shaded visual style.
</summary>
</member>
<member name="F:kConceptual" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2144">
<summary>
Gooch shaded visual style.
</summary>
</member>
<member name="F:kCustom" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2148">
<summary>
Custom, user defined visual visual style.
</summary>
</member>
<member name="F:kDim" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2153">
<summary>
Visual style used for a dimming effect.
</summary>
</member>
<member name="F:kBrighten" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2157">
<summary>
Visual style used for a brightening effect.
</summary>
</member>
<member name="F:kThicken" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2161">
<summary>
Visual style used for a thickening effect.
</summary>
</member>
<member name="F:kLinePattern" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2165">
<summary>
Visual style used to apply a line pattern.
</summary>
</member>
<member name="F:kFacePattern" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2169">
<summary>
Visual style used to apply a face pattern.
</summary>
</member>
<member name="F:kColorChange" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2173">
<summary>
Visual style used to apply a change of color.
</summary>
</member>
<member name="F:kFaceOnly" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2181">
<summary>
Face properties only visual style.  All non-face properties are set to inherit.
</summary>
</member>
<member name="F:kEdgeOnly" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2186">
<summary>
Edge properties only visual style.  All non-edge properties are set to inherit.
</summary>
</member>
<member name="F:kDisplayOnly" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2191">
<summary>
Display properties only visual style.  All non-display properties are set to inherit.
</summary>
</member>
<member name="F:kJitterOff" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2199">
<summary>
Edge style override visual style with jitter edges off.  All other properties are
set to inherit.
</summary>
</member>
<member name="F:kOverhangOff" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2205">
<summary>
Edge style override visual style with overhang edges off.  All other properties are
set to inherit.
</summary>
</member>
<member name="F:kEdgeColorOff" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2211">
<summary>
Edge style override visual style with edge color off.  All other properties are
set to inherit.
</summary>
</member>
<member name="F:kShadesOfGray" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2217">
<summary>
shades of gary visual style
</summary>
</member>
<member name="F:kSketchy" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2221">
<summary>
sketchy visual style
</summary>
</member>
<member name="F:kXRay" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2225">
<summary>
xray visual style
</summary>
</member>
<member name="F:kShadedWithEdges" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2229">
<summary>
shade with edges visual style
</summary>
</member>
<member name="F:kShaded" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2233">
<summary>
shaded visual style
</summary>
</member>
<member name="F:kByViewport" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2237">
<summary>
dummy visual style
</summary>
</member>
<member name="F:kByLayer" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2241">
<summary>
dummy visual style
</summary>
</member>
<member name="F:kByBlock" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2245">
<summary>
dummy visual style
</summary>
</member>
<member name="F:kEmptyStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2250">
<summary>
Visual style with all properties set to inherit.  This effectively
creates an empty style upon which a custom visual style can be built.
</summary>
</member>
<member name="M:AcGiVisualStyle.#ctor" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2258">
<summary>
Default constructor.  Initializes members to default values.
</summary>
</member>
<member name="M:AcGiVisualStyle.#ctor(AcGiVisualStyle.Type)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2263">
<summary>
Constructor.
</summary>
<param name="type">
Input Type. The type of visual style to configure - a built-in type or
custom.
</param>
</member>
<member name="M:AcGiVisualStyle.#ctor(AcGiVisualStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2272">
<summary>
Copy constructor.  Copies the given visual style into this visual style.
</summary>
<param name="visualStyle">
Input AcGiVisualStyle. A constant reference to the visual style 
which will be copied into this visual style.
</param>
</member>
<member name="M:AcGiVisualStyle.Dispose" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2281">
<summary>
Destructor.  Performs any necessary cleanup of the visual style.
</summary>
</member>
<member name="M:AcGiVisualStyle.op_Assign(AcGiVisualStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2286">
<summary>
Assignment operator.  Copies the given visual style into this visual style.
</summary>
<param name="visualStyle">
Input AcGiVisualStyle. A constant reference to the visual style 
which will be copied into this visual style.
</param>                               
<returns>
Returns a reference to the visual style into which the copy was made.
</returns>
</member>
<member name="M:AcGiVisualStyle.op_Equality(AcGiVisualStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2298">
<summary>
Comparison operator.  Compares the given visual style with this visual style.
</summary>
<param name="visualStyle">
Input AcGiVisualStyle. A constant reference to the visual style 
which will be compared to this visual style.
</param>                               
<returns>
Returns boolean value representing whether the given visual style is equivalent
to this visual style.
</returns>
</member>
<member name="M:AcGiVisualStyle.setType(AcGiVisualStyle.Type)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2315">
<summary>
Sets the visual style type, modifying multiple properties as necessary to 
change the visual style into the specified type.
</summary>
<param name="type">
Input enum Type to set into the visual style.
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
</member>
<member name="M:AcGiVisualStyle.type" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2327">
<summary>
Gets the visual style type.
</summary>
<returns>
Type of visual style.
</returns>    
</member>
<member name="M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,AcGiVisualStyleOperations.Operation)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2339">
<summary>
Sets the operation associated with a property.
</summary>
<param name="prop">
The AcGiVisualStyleProperties::Property to set the operation for.
</param>
<param name="op">
The AcGiVisualStyleOperations::Operation for the property to use. 
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
</member>
<!-- 丢弃成员“M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,AcGiVariant!System.Runtime.CompilerServices.IsConst*,AcGiVisualStyleOperations.Operation)”的格式错误的 XML 文档注释。 -->
<member name="M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,System.Int32,AcGiVisualStyleOperations.Operation)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2379">
<summary>
Sets an integer property of the visual style.
</summary>
<param name="prop">
Input AcGiVisualStyleProperties::Property to set into the visual style.  Valid
Property values for this method are:
</param>                               
<param name="nVal">
Input integer property value to set into the visual style.
</param>                               
<param name="op">
Input AcGiVisualStyleOperations::Operation to use when setting the property into the visual style. 
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
<example>

// Set lighting model to kGooch
using namespace AcGiVisualStyleProperties;
acgiVisualStyle.setTrait (kFaceLightingModel, kGooch);

// Set halogap to 20
acgiVisualStyle.setTrait (AcGiVisualStyleProperties::kEdgeHaloGap, 20);

</example>
</member>
<member name="M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,System.Boolean,AcGiVisualStyleOperations.Operation)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2426">
<summary>
Sets a boolean property of the visual style.
</summary>
<param name="prop">
Input AcGiVisualStyleProperties::Property to set into the visual style.  Valid
Property values for this method are:
</param>                               
<param name="bVal">
Input boolean property value to set into the visual style.
</param>                               
<param name="op">
Input AcGiVisualStyleOperations::Operation to use when setting the property into the visual style. 
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
<example>

// Set hide precision to false
acgiVisualStyle.setTrait (AcGiVisualStyleProperties::kEdgeHidePrecision, false);

</example>
</member>
<member name="M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,System.Double,AcGiVisualStyleOperations.Operation)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2456">
<summary>
Sets a double property of the visual style.
</summary>
<param name="prop">
Input AcGiVisualStyleProperties::Property to set into the visual style.  Valid
Property values for this method are:
</param>                               
<param name="dVal">
Input double property value to set into the visual style.
</param>                               
<param name="op">
Input AcGiVisualStyleOperations::Operation to use when setting the property into the visual style. 
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
<example>

// Set brightness to 1.0
acgiVisualStyle.setTrait (AcGiVisualStyleProperties::kDisplayBrightness, 1.0);

</example>
</member>
<member name="M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,System.Double,System.Double,System.Double,AcGiVisualStyleOperations.Operation)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2487">
<summary>
Sets a color property of the visual style.
</summary>
<param name="prop">
Input AcGiVisualStyleProperties::Property to set into the visual style.  Valid
Property values for this method are:
</param>
<param name="red">
Input red color value to set into the visual style.  Valid value is from 0.0 to 1.0.
</param>
<param name="green">
Input green color value to set into the visual style.  Valid value is from 0.0 to 1.0.
</param>
<param name="blue">
Input blue color value to set into the visual style.  Valid value is from 0.0 to 1.0.
</param>
<param name="op">
Input AcGiVisualStyleOperations::Operation to use when setting the property into the visual style. 
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
<example>

// Set edge intersection color to 110% red
acgiVisualStyle.setTrait (AcGiVisualStyleProperties::kEdgeIntersectionColor, 1.1, 1.0, 1.0);

</example>
</member>
<!-- 丢弃成员“M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,AcCmColor!System.Runtime.CompilerServices.IsConst*,AcGiVisualStyleOperations.Operation)”的格式错误的 XML 文档注释。 -->
<!-- 丢弃成员“M:AcGiVisualStyle.setTrait(AcGiVisualStyleProperties.Property,AcString!System.Runtime.CompilerServices.IsConst*,AcGiVisualStyleOperations.Operation)”的格式错误的 XML 文档注释。 -->
<member name="M:AcGiVisualStyle.trait(AcGiVisualStyleProperties.Property,AcGiVisualStyleOperations.Operation*)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2587">
<summary>
Gets a property of the visual style.  
</summary>
<param name="prop">
Input AcGiVisualStyleProperties::Property to get from the visual style.
</param>                               
<param name="pOp">
Output AcGiVisualStyleOperations::Operation to get the operation 
currently in effect for this property.  If NULL, nothing is returned.
</param>
<returns>
Returns the AcGiVariant value of the property if successful; otherwise,
returns an AcGiVariant of type AcGiVariant::kUndefined.
</returns>    
<example>

AcGiVariant displayBrightness = 
    acgiVisualStyle.trait (AcGiVisualStyleProperties::kDisplayBrightness);

</example>
</member>
<member name="M:AcGiVisualStyle.operation(AcGiVisualStyleProperties.Property)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2610">
<summary>
Gets the operation associated with a property.
</summary>
<param name="prop">
Name of the property for which to get the associated operation value.
</param>
<returns>
The operation associated with the property.  For invalid property
values, the return value is kInvalidOperation.
</returns>
</member>
<member name="M:AcGiVisualStyle.setTraitFlag(AcGiVisualStyleProperties.Property,System.UInt32!System.Runtime.CompilerServices.IsLong,System.Boolean)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2622">
<summary>
Sets a property flag into the visual style, for properties which are bitfield enums.
</summary>
<param name="flagProp">
Input bitfield enum AcGiVisualStyleProperties::Property to set into the visual style.
</param>                               
<param name="flagVal">
Input bit flag enum unsigned long property to set into the visual style.
</param>                               
<param name="bEnable">
Input bool set to true to enable the flag, false to disable. 
</param>
<returns>
Returns true if successful; otherwise, returns false.
</returns>
<example>

using namespace AcGiVisualStyleProperties;
acgiVisualStyle.setTraitFlag (kEdgeModifier, kJitter, true);

</example>
</member>
<member name="M:AcGiVisualStyle.traitFlag(AcGiVisualStyleProperties.Property,System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2647">
<summary>
Gets a property flag from the visual style, for properties which are bitfield enums.
</summary>
<param name="flagProp">
Input bitfield enum AcGiVisualStyleProperties::Property to get from the visual style.
</param>                               
<param name="flagVal">
Input bit flag enum unsigned long property to get from the visual style.
</param>                               
<returns>
Returns true if flag is enabled, false otherwise. 
</returns>    
<example>

using namespace AcGiVisualStyleProperties;
bool bJitterEnabled = acgiVisualStyle.traitFlag(kEdgeModifier, kJitter);

</example>
</member>
<member name="M:AcGiVisualStyle.propertyType(AcGiVisualStyleProperties.Property)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2668">
<summary>
Gets data type of the specified visual style property.
</summary>
<param name="prop">
Input enum AcGiVisualStyleProperties::Property.
</param>                               
<returns>
Returns the AcGiVariant::VariantType of the specified visual style property.
</returns>    
</member>
<member name="M:AcGiVisualStyle.configureForType(AcGiVisualStyle.Type)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2684">
<summary>
Configures a visual style of the given type.  
</summary>
<param name="type">
Input Type value enumeration value to configure.
</param>
<remarks>
This method is deprecated.  Use type()/setType() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.faceStyle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2695">
<summary>
Reports the face style of this visual style.
</summary>
<returns>
Returns AcGiFaceStyle reference to the face style of this visual style.
</returns>
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.edgeStyle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2706">
<summary>
Reports the edge style of this visual style.
</summary>
<returns>
Returns AcGiEdgeStyle reference to the edge style of this visual style.
</returns>
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.displayStyle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2717">
<summary>
Reports the display style of this visual style.
</summary>
<returns>
Returns AcGiDisplayStyle reference to the display style of this visual style.
</returns>
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.faceStyle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2728">
<summary>
Reports the face style of this visual style.
</summary>
<returns>
Returns AcGiFaceStyle const reference to the face style of this visual style.
</returns>
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.edgeStyle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2739">
<summary>
Reports the edge style of this visual style.
</summary>
<returns>
Returns AcGiEdgeStyle const reference to the edge style of this visual style.
</returns>
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.displayStyle" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2750">
<summary>
Reports the display style of this visual style.
</summary>
<returns>
Returns AcGiDisplayStyle const reference to the display style of this visual style.
</returns>
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.setFaceStyle(AcGiFaceStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2761">
<summary>
Sets the face style of this visual style to the given face style.  
</summary>
<param name="style">
Input AcGiFaceStyle const reference to the face style to set in this
visual style.
</param>                               
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.setEdgeStyle(AcGiEdgeStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2773">
<summary>
Sets the edge style of this visual style to the given edgestyle.  
</summary>
<param name="style">
Input AcGiEdgeStyle const reference to the edge style to set in this
visual style.
</param>                               
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="M:AcGiVisualStyle.setDisplayStyle(AcGiDisplayStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acgivisualstyle.h" line="2785">
<summary>
Sets the display style of this visual style to the given display style.  
</summary>
<param name="style">
Input AcGiDisplayStyle const reference to the display style to set in this
visual style.
</param>                               
<remarks>
This method is deprecated.  Use traits*()/setTraits*() methods instead.
</remarks>
</member>
<member name="T:AcGiVisualStyleTraits" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2810">
<summary> 
This class defines the visual style traits.  Derived from AcGiDrawableTraits,
this class provides the interfaces to implement for setting and returning the
visual style via drawable traits.
</summary>

<remarks>

</remarks>
</member>
<member name="M:AcGiVisualStyleTraits.setAcGiVisualStyle(AcGiVisualStyle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2824">
<summary>
Sets the visual style to capture in the drawable traits.
</summary>
<param name="visualStyle">
Input AcGiVisualStyle const reference to the visual style to capture.
</param>                               
</member>
<member name="M:AcGiVisualStyleTraits.acgiVisualStyle" decl="false" source="c:\objectarx\inc\acgivisualstyle.h" line="2832">
<summary>
Reports the visual style that is currently captured in this drawable traits.
</summary>
<returns>
Returns AcGiVisualStyle const reference to the visual style that is 
currently captured in this drawable traits.
</returns>
</member>
<member name="M:AcDbViewTableRecord.getThumbnail(tagBITMAPINFO**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsymtb.h" line="1179">
<summary>
This function provides BITMAP thumbnail of view as output
</summary>
<param name="thumbnail"> A reference to a pointer of Bitmap thumbnail, containing header and pixels </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>

</member>
<member name="M:AcDbViewTableRecord.setThumbnail(tagBITMAPINFO!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbsymtb.h" line="1187">
<summary>
This function sets BITMAP thumbnail into view
</summary>
<param name="thumbnail"> A pointer of Bitmap thumbnail to be set into view </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>

</member>
<member name="M:AcDbViewTableRecord.getPreviewImage(Atil.Image**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsymtb.h" line="1195">
<summary>
This function provides Atil::Image thumbnail of view as output
</summary>
<param name="pPreviewImage"> A reference to the pointer of Atil::Image thumbnail </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="M:AcDbViewTableRecord.setPreviewImage(Atil.Image!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbsymtb.h" line="1204">
<summary>
This functions sets Atil::Image thumbnail into view
</summary>
<param name="pPreviewImage"> A pointer of Atil::Image thumbnail to be set into view </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="T:AcDbAlignment" decl="false" source="c:\objectarx\inc\dbalignment.h" line="28">
<summary>
This class allows applications to provide an alignment point and 
vector for a custom entity.
</summary>

<remarks>
Currently only called when alignment grip editing an AcDbBlockReference.
</remarks>

</member>
<member name="M:AcDbAlignment.getAlignment(AcDbEntity*,AcArray&lt;AcArray&lt;AcDbObjectId&gt;,AcArrayObjectCopyReallocator&lt;AcArray&lt;AcDbObjectId&gt;&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\dbalignment.h" line="41">
<summary>
Provide an alignment point and vector for an entity. 
</summary>

<param name="pEnt">
[Input] The entity to align to.
</param>
<param name="pickPoint">
[Input] Current cursor location (WCS).
</param>
<param name="normal">
[Input] Normal of entity that is being aligned. This can be
  used by an application to ignore (not align to) entities not in the
  plane of the entity.
</param>
<param name="closestPoint">
[Output] Alignment point on entity. This is usually the closest point
  on the entity to the cursor, but may be a snapped or osnap point.
</param>
<param name="direction">
[Output} WCS alignment vector.
</param>

<returns>
Acad::eOk if successful.
</returns>

<remarks>
Returns an alignment point and vector.
</remarks>

</member>
<member name="M:AcDbDimension.subDimensionStyle" decl="true" source="c:\objectarx\inc\dbdim.h" line="328">
<summary>
This function returns the object ID of the AcDbDimStyleTableRecord 
referenced by the dimension. 
</summary>
<remarks>
The text string name within the referenced DimStyleTableRecord is used
for DXF group code 3.
</remarks>
<returns>
Returns object ID of the AcDbDimStyleTableRecord referenced by the dimension.
</returns>
</member>
<member name="M:AcDbDimension.subSetDimensionStyle(AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdim.h" line="341">
<summary>
This function sets the dimension to use the AcDbDimStyleTableRecord with
the object ID styleId.
</summary>
<remarks>
If styleId is AcDbObjectId::kNull (or just NULL), then when the dimension
is closed it will be set to use the current default dimStyle in the
AutoCAD editor. The text string name within the referenced
DimStyleTableRecord is used for DXF group code 3.
</remarks>
<param name="dimStyleId">Input object ID to be used by AcDbDimStyleTableRecord.
</param>
<returns>
Returns Acad::eOk if operation is successful.
</returns>
</member>
<member name="M:AcDbDimension.subGetDimstyleData(AcDbDimStyleTableRecord**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdim.h" line="358">
<summary>
This function copies the dimstyle information from the AcDbDimStyleTableRecord
referenced by the dimension into the AcDbDimStyleTableRecord pointed to
by pRecord. After copying the data, any dimension variable overrides currently
applied to the dimension will be copied into the record pointed to by pRecord. 
The result is that pRecord represents the effective style settings currently
in use by this object.
</summary>
<param name="pRecord">Input pointer to a pre-existing non-database-resident
record.
</param>
<returns>
This function returns Acad::eOk if successful. Acad::eInvalidInput will be
returned if pRecord is not a valid AcDbDimStyleTableRecord. 
Acad::eInvalidDimStyle will be returned if the dimension there is an invalid
dimension style associated with this dimension. Various open codes can be
returned if the associated AcDbDimStyleTableRecord cannot be opened.
Acad::eNullObjectPointer will be returned if pRecord or the associated
AcDbDimStyleTableRecord is NULL.
</returns>
</member>
<member name="M:AcDbDimension.subSetDimstyleData(AcDbDimStyleTableRecord*)" decl="true" source="c:\objectarx\inc\dbdim.h" line="380">
<summary>
This function compares the dimstyledata in the record pointed to by
pNewData with the data in the record referenced by the dimension,
and applies any differences as dimension variable overrides on the
dimension. So, when this function is finished, the combination of the
referenced DimStyleTableRecord and the newly applied dimension variable
overrides will make the dimension display as though it were actually
referencing the DimStyleTableRecord pNewData.
</summary>
<remarks>
The DimStyleTableRecord pointed to by pNewData may be database-resident,
but that is not required for this function to use it. If it is 
database-resident, it can be in any database currently loaded in memory.
</remarks>
<param name="pNewData">Input pointer to the AcDbDimStyleTableRecord
whose data is to be applied to this dimension.
</param>
<returns>
This function returns Acad::eOk if successful. Acad::eInvalidInput
will be returned if pRecord is not a valid AcDbDimStyleTableRecord.
Acad::eInvalidDimStyle will be returned if the dimension there is an
invalid dimension style associated with this dimension. Various open
codes can be returned if the associated AcDbDimStyleTableRecord cannot
be opened.
</returns>
</member>
<member name="M:AcDbDimension.subSetDimstyleData(AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdim.h" line="407">
<summary>
This function compares the dimstyle data in the record identified by
newDataId with the data in the record referenced by the dimension,
and applies any differences as dimension variable overrides on the
dimension. So, when this function is finished, the combination of the
referenced DimStyleTableRecord and the newly applied dimension variable
overrides will make the dimension display as though it were actually
referencing the DimStyleTableRecord newDataId.
</summary>
<remarks>
The DimStyleTableRecord identified by newDataId can be in any database
currently loaded in memory.
</remarks>
<param name="newDataId">Input object ID of the AcDbDimStyleTableRecord
whose data is to be applied to this dimension.
</param>
<returns>
This function returns Acad::eOk if successful. Acad::eInvalidInput
will be returned if pRecord is not a valid AcDbDimStyleTableRecord.
Acad::eInvalidDimStyle will be returned if the dimension there is an
invalid dimension style associated with this dimension. Various open
codes can be returned if the associated AcDbDimStyleTableRecord cannot
be opened.
</returns>
</member>
<member name="T:AcDbDimensionStyleOverrule" decl="false" source="c:\objectarx\inc\dbdim.h" line="847">
<property name="versionspecific" value="=18.1.0.0"/>

<summary>
AcDbDimensionStyleOverrule overrules a subset of dimension style related
operations that AcDbDimension class specifies. It is intended
as a base class for clients who want to alter some or all
behavior of a given AcDbDimension-derived class. At the base
level, each default implementation simply calls the
corresponding method in the target class.
</summary>  
</member>
<member name="M:AcDbDimensionStyleOverrule.dimensionStyle(AcDbDimension!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbdim.h" line="864">
<property name="versionspecific" value="=18.1.0.0"/>

<summary>
Overrules AcDbDimension::dimensionStyle method.
</summary>
<remarks>
The default implementation of
AcDbDimensionStyleOverrule::dimensionStyle calls
AcDbDimension::subDimensionStyle.
</remarks>
<param name="pSubject">Pointer to an AcDbDimension that this
                       overrule is applied against.</param>
<returns>
Returns object ID of the AcDbDimStyleTableRecord referenced by the dimension.
</returns>
</member>
<member name="M:AcDbDimensionStyleOverrule.setDimensionStyle(AcDbDimension*,AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdim.h" line="881">
<property name="versionspecific" value="=18.1.0.0"/>

<summary>
Overrules AcDbDimension::setDimensionStyle.
</summary>
<param name="pSubject">Pointer to an AcDbDimension that this
                       overrule is applied against.</param>
<param name="dimStyleId">Input object ID of the desired AcDbDimStyleTableRecord
to be used by dimension</param>
<remarks>
The default implementation of AcDbDimensionStyleOverrule::setDimensionStyle
calls the protected AcDbDimension::subSetDimensionStyle method. 
</remarks>
<returns>
Returns Acad::eOk if operation is successful.
</returns>
</member>
<member name="M:AcDbDimensionStyleOverrule.getDimstyleData(AcDbDimension!System.Runtime.CompilerServices.IsConst*,AcDbDimStyleTableRecord**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdim.h" line="900">
<property name="versionspecific" value="=18.1.0.0"/>

<summary>
Overrules AcDbDimension::getDimstyleData method.
</summary>
<param name="pSubject">Pointer to an AcDbDimension that this
                       overrule is applied against.</param>
<param name="pRecord">Input pointer to an existing AcDbDimStyleTableRecord
to which the dimension variable data will be copied.</param>
<remarks>
Default implementation of AcDbDimensionStyleOverrule::getDimstyleData
calls protected AcDbDimension::subGetDimstyleData method.

</remarks>                                                   
<returns>
Returns Acad::eOk if operation is successful.
</returns>
</member>
<member name="M:AcDbDimensionStyleOverrule.setDimstyleData(AcDbDimension*,AcDbDimStyleTableRecord*)" decl="true" source="c:\objectarx\inc\dbdim.h" line="920">
<property name="versionspecific" value="=18.1.0.0"/>

<summary>
Overrules AcDbDimension::setDimstyleData method.
</summary>
<param name="pSubject">Pointer to an AcDbDimension that this
                       overrule is applied against.</param>
<param name="pRecord">Input pointer to AcDbDimStyleTableRecord
from which to copy dimension variable information.</param>
<remarks>
Default implementation of AcDbDimensionStyleOverrule::setDimstyleData
calls protected AcDbDimension::subSetDimstyleData method.

</remarks>                                                   
<returns>
Returns Acad::eOk if operation is successful.
</returns>
</member>
<member name="M:AcDbDimensionStyleOverrule.setDimstyleData(AcDbDimension*,AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdim.h" line="940">
<property name="versionspecific" value="=18.1.0.0"/>

<summary>
Overrules AcDbDimension::setDimstyleData method.
</summary>
<param name="pSubject">Pointer to an AcDbDimension that this
                       overrule is applied against.</param>
<param name="dimstyleId">Input object ID of AcDbDimStyleTableRecord
from which to copy dimension variable information</param>
<remarks>
Default implementation of AcDbDimensionStyleOverrule::setDimstyleData
calls protected AcDbDimension::subSetDimstyleData method.

</remarks>                                                   
<returns>
Returns Acad::eOk if operation is successful.
</returns>
</member>
<member name="M:AcDbViewport.getThumbnail(tagBITMAPINFO**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbents.h" line="1156">
<summary>
This function provides BITMAP thumbnail of viewport as output
</summary>
<param name="thumbnail"> A reference to a pointer of Bitmap thumbnail, containing header and pixels </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>

</member>
<member name="M:AcDbViewport.setThumbnail(tagBITMAPINFO!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbents.h" line="1164">
<summary>
This function sets BITMAP thumbnail into viewport
</summary>
<param name="thumbnail"> A pointer of Bitmap thumbnail to be set into viewport </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>

</member>
<member name="M:AcDbViewport.getPreviewImage(Atil.Image**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbents.h" line="1172">
<summary>
This function provides Atil::Image thumbnail of viewport as output
</summary>
<param name="pPreviewImage"> A reference to the pointer of Atil::Image thumbnail </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="M:AcDbViewport.setPreviewImage(Atil.Image!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbents.h" line="1181">
<summary>
This functions sets Atil::Image thumbnail into viewport
</summary>
<param name="pPreviewImage"> A pointer of Atil::Image thumbnail to be set into viewport </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="T:AcDbEvalVariant" decl="false" source="c:\objectarx\inc\dbeval.h" line="87">
<summary>
This class provides a lightweight wrapper for a resbuf structure.  It
provides typed constructors and overloaded assignment operators to
facilitiate assignig values to the underlying data. AcDbEvalExpr objects
return instances of this class for the "result" of the expressions. 
</summary>

<remarks>
The class manages the copying of strings by calling acutNewString() to copy
strings. Linked lists of resbufs are not directly supported, but if an
AcDbEvalVariant contains a linked resbuf chain the destructor will free the
entire chain using acutRelRb(). 
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="107">
<summary>
Default constructor.
</summary>

<remarks> Allocates the resbuf and initializes the variant type to
AcDbEvalVariant::kNone.  
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="117">
<summary>
Copy contstructor.
</summary>

<param name="other">
The object to copy from. 
</param>

</member>
<member name="M:AcDbEvalVariant.#ctor(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="127">
<summary>
Copy contstructor.
</summary>

<param name="pOther">
A pointer to the object to copy from. 
</param>

</member>
<member name="M:AcDbEvalVariant.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="137">
<summary>
Destructor.
</summary>

<remarks>
The data in the underlying resbuf is freed by this destructor. Strings
are freed using acutDelString(), and linked resbuf chains are freed
using acutRelRb().
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(System.Double)" decl="true" source="c:\objectarx\inc\dbeval.h" line="149">
<summary>
Constructs an AcDbEvalVariant wrapping a double value.
</summary>

<param name="dVal">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kDouble.
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(System.Int16)" decl="true" source="c:\objectarx\inc\dbeval.h" line="163">
<summary>
Constructs an AcDbEvalVariant wrapping a short integer value.
</summary>

<param name="iVal">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kShort.
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="177">
<summary>
Constructs an AcDbEvalVariant wrapping a string value.
</summary>

<param name="szVal">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kString.
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(System.Int32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\dbeval.h" line="191">
<summary>
Constructs an AcDbEvalVariant wrapping a long value.
</summary>

<param name="lVal">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kLong.
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="205">
<summary>
Constructs an AcDbEvalVariant wrapping an AcDbObjectId.
</summary>

<param name="id">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kOldId.
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(AcGePoint2d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="219">
<summary>
Constructs an AcDbEvalVariant wrapping a 2D point.
</summary>

<param name="pt">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kPoint2d
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="233">
<summary>
Constructs an AcDbEvalVariant wrapping a 3D point. 
</summary>

<param name="pt">
The value to assign to the object.
</param>

<remarks>
The variant type is set to AcDbEvalVariant::kPoint3d.
</remarks>

</member>
<member name="M:AcDbEvalVariant.#ctor(resbuf!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="247">
<summary>
Constructs an AcDbEvalVariant from a resbuf.
</summary>

<param name="pt">
The value to assign to the object.
</param>

<remarks>
The variant type is set to rb.restype.
</remarks>
</member>
<member name="M:AcDbEvalVariant.op_Assign(resbuf!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="260">
<summary>
Assigns an AcDbEvalVariant to a resbuf.
</summary>

<param name="dVal">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to rb.restype.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(System.Double)" decl="true" source="c:\objectarx\inc\dbeval.h" line="278">
<summary>
Assigns an AcDbEvalVariant to a double value.
</summary>

<param name="dVal">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kDouble.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(System.Int16)" decl="true" source="c:\objectarx\inc\dbeval.h" line="296">
<summary>
Assigns an AcDbEvalVariant to a short value.
</summary>

<param name="iVal">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kShort.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(System.Int32!System.Runtime.CompilerServices.IsLong)" decl="true" source="c:\objectarx\inc\dbeval.h" line="314">
<summary>
Assigns an AcDbEvalVariant to a long value.
</summary>

<param name="lVal">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kLong.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="332">
<summary>
Assigns an AcDbEvalVariant to a character string.
</summary>

<param name="szVal">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kString.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="350">
<summary>
Assigns an AcDbEvalVariant to the value stored in another
AcDbEvalVariant.
</summary>

<param name="other">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

</member>
<member name="M:AcDbEvalVariant.op_Assign(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="365">
<summary>
Assigns an AcDbEvalVariant to the value of an AcDbObjectId.
</summary>

<param name="id">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kOldId.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(AcGePoint2d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="383">
<summary>
Assigns an AcDbEvalVariant to a 2D point value.
</summary>

<param name="pt">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kPoint2d.
</remarks>

</member>
<member name="M:AcDbEvalVariant.op_Assign(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="401">
<summary>
Assigns an AcDbEvalVariant to a 3D point value.
</summary>

<param name="pt">
The value to assign to the object.
</param>

<returns> 
A reference to the updated variant.
</returns>

<remarks>
The variant type is set to AcDbEvalVariant::kPoint3d.
</remarks>

</member>
<member name="M:AcDbEvalVariant.clear" decl="true" source="c:\objectarx\inc\dbeval.h" line="419">
<summary>
Clears the contents of the AcDbEvalVariant and frees any allocated
memory, including resbuf chains descending from this AcDbEvalVariant.
Changed the <c>AcDbEvalVariant::restype</c> to AcDbEvalVariant::kNone.
</summary>
</member>
<member name="M:AcDbEvalVariant.copyFrom(AcRxObject!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="426">
<summary> 
Copies the value and data from a source AcDbEvalVariant object into this object.
</summary>

<param name="pOther">
A pointer to the AcDbEvalVariant to copy from. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eWrongObjectType if
<c>pObject</c> is not an AcDbEvalVariant. 
</returns>
</member>
<member name="M:AcDbEvalVariant.op_LessThan(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="440">
<summary> 
Tests whether this AcDbEvalVariant is less than another.
This operator may only be used if both AcDbEvalVariants are of
type kDouble, kShort, kLong, or kString.
</summary>
<param name="val">
AcDbEvalVariant to compare to. 
</param>
<returns>
True if this AcDbEvalVariant is less than val, false otherwise.
If the two AcDbEvalVariants are of different types or if the
data type is not kDouble, kShort, kLong, or kString then
a value of false will be returned.
</returns>
</member>
<member name="M:AcDbEvalVariant.op_GreaterThan(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="456">
<summary> 
Tests whether this AcDbEvalVariant is greater than another.
This operator may only be used if both AcDbEvalVariants are of
type kDouble, kShort, kLong, or kString.
</summary>
<param name="val">
AcDbEvalVariant to compare to. 
</param>
<returns>
True if this AcDbEvalVariant is greater than val, false otherwise. 
If the two AcDbEvalVariants are of different types or if the
data type is not kDouble, kShort, kLong, or kString then
a value of false will be returned.
</returns>
</member>
<member name="M:AcDbEvalVariant.op_LessThanOrEqual(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="472">
<summary> 
Tests whether this AcDbEvalVariant is less than or equal to another.
This operator may only be used if both AcDbEvalVariants are of
type kDouble, kShort, kLong, or kString.
</summary>
<param name="val">
AcDbEvalVariant to compare to. 
</param>
<returns>
True if this AcDbEvalVariant is less than or equal to val,
false otherwise.  If the two AcDbEvalVariants are of different types
or if the data type is not kDouble, kShort, kLong, or kString then
a value of false will be returned.
</returns>
</member>
<member name="M:AcDbEvalVariant.op_GreaterThanOrEqual(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="488">
<summary> 
Tests whether this AcDbEvalVariant is greater than or equal to another.
This operator may only be used if both AcDbEvalVariants are of
type kDouble, kShort, kLong, or kString.
</summary>
<param name="val">
AcDbEvalVariant to compare to. 
</param>
<returns>
True if this AcDbEvalVariant is greater than or equal to val,
false otherwise.  If the two AcDbEvalVariants are of different types
or if the data type is not kDouble, kShort, kLong, or kString then
a value of false will be returned.
</returns>
</member>
<member name="M:AcDbEvalVariant.op_Equality(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="504">
<summary> 
Tests whether this AcDbEvalVariant is equal to another.
</summary>
<param name="val">
AcDbEvalVariant to compare to. 
</param>
<returns>
True if this AcDbEvalVariant is equal to val, false otherwise. 
If the two AcDbEvalVariants are of different types then
a value of false will be returned.
</returns>
</member>
<member name="M:AcDbEvalVariant.op_Inequality(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="517">
<summary> 
Tests whether this AcDbEvalVariant is unequal to another.
</summary>
<param name="val">
AcDbEvalVariant to compare to. 
</param>
<returns>
True if this AcDbEvalVariant is unequal to val, false otherwise. 
If the two AcDbEvalVariants are of different types then
a value of true will be returned.
</returns>
</member>
<member name="M:AcDbEvalVariant.toAcRxValue(AcRxValueType!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcRxValue*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="555">
<summary>
Converts an AcDbEvalVariant to an AcRxValue.
</summary>
<param name="type">
The expected type of the returned AcRxValue.
</param>
<param name="value">
The returned AcRxValue.
</param>
<returns>
Returns Acad::eOk if successful, returns eInvalidInput if the
conversion could not be performed. 
</returns>
</member>
<member name="M:AcDbEvalVariant.fromAcRxValue(AcRxValue!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="571">
<summary>
Converts an AcRxValue to an AcDbEvalVariant. 
</summary>
<param name="value">
The AcRxValue to convert. 
</param>
<returns>
Returns Acad::eOk if successful, returns eInvalidInput if the
conversion could not be performed and leaves the variant unmodified. 
</returns>
</member>
<member name="M:AcDbEvalVariant.init" decl="true" source="c:\objectarx\inc\dbeval.h" line="584">
<summary>
Initializes the contents of the AcDbEvalVariant. 
</summary>

<remarks>
Called by constructor overloads to initialize the base resbuf memory. 
</remarks>
</member>
<member name="T:AcDbEvalGraph" decl="false" source="c:\objectarx\inc\dbeval.h" line="608">
<summary>
This class holds the network of inter-related 'elements' that implement the
smart behavior. Each individual 'element' (or AcDbEvalExpr) can depend on
zero or more other AcDbEvalExprs. So - it is the role of AcDbEvalGraph to
invoke the AcDbEvalExpr::evaluate() method for each of the elements it
contains when it is the right time to do so.  Right, in the sense, all the
AcDbEvalExprs that are depended on have had their evaluate() invoked. In
order to reprsent the inter-AcDbEvalExpr dependency - the AcDbEvalGraph
represents a Directed Graph. If an AcDbEvalExpr E1 depends on (requires
input from) an AcDbEvalExpr E2 - there is an edge from E2 to E1 represented
in the graph.

During evaluation, based on what AcDbEvalExpr's are 'active' (i.e. are
directly modified, for example, through the property palette, or grip
editing), is driven activation of a subset of AcDbEvalExprs reachable from
the activated set. The resulting subgraph is expected to be a DAG. It is
then topologically sorted to determine node evaluation order.

The current internal use of this graph class is for 'Enhanced Blocks' where
a graph of the expressions is maintained on the Block Table Record. This
graph is queried at graph editing time, and evaluated in order to trigger
the networked nodes (AcDbEvalExprs) that, through their evaluate() methods
being invoked, end up implementing the 'enhanced' behavior.
</summary>

<seealso cref="T:AcDbEvalExpr"/>

</member>
<member name="T:AcDbEvalGraph.NodeId" decl="false" source="c:\objectarx\inc\dbeval.h" line="639">
<summary>
Special AcDbEvalNodeId values. 
</summary>

</member>
<member name="F:kNullNodeId" decl="false" source="c:\objectarx\inc\dbeval.h" line="645">
<summary>
Null node Id. 
</summary>
</member>
<member name="M:AcDbEvalGraph.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="653">
<summary>
Default constructor, constructs an empty graph.
</summary>

</member>
<member name="M:AcDbEvalGraph.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="659">
<summary>
Destructor.
</summary>
</member>
<member name="M:AcDbEvalGraph.hasGraph(AcDbObject!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="669">
<summary>
Determines if a graph exists on the supplied object.  The object must 
be database resident.
</summary>

<param name="pObj">
The object from which to retrieve the graph.
</param>
<param name="pKey">
The key at which the graph is associated. This means multiple graphs
can be associated with one object.
</param>

<returns>
Returns true if the graph exists. 
</returns>
</member>
<member name="M:AcDbEvalGraph.getGraph(AcDbObject!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,AcDbEvalGraph**,AcDb.OpenMode!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\objectarx\inc\dbeval.h" line="688">
<summary>
Retrieves a graph, if one exists, from the supplied object with the
requested open mode. The object must be database resident.
</summary>

<param name="pObj">
The object from which to retrieve the graph.
</param>
<param name="pKey">
The key at which the graph is associated. This means multiple graphs
can be associated with one object.
</param>
<param name="pGraph">
Result graph. *pGraph is set to NULL if not found.
</param>
<param name="mode">
The mode in which to open the graph.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if the
graph with the specified key name does not exist.
</returns>

<remarks>
The calling application is responsible for calling close() on the
returned graph when it is no longer needed. 
</remarks>

</member>
<member name="M:AcDbEvalGraph.createGraph(AcDbObject*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="722">
<summary>
Creates a graph on the object at the supplied key. The object must be
database resident.
</summary>

<param name="pObj">
Object on which to create a graph.
</param>
<param name="pKey">
Key at which to associate the new graph.
</param>

<returns>
Returns Acad::eOk if successful. Returns eAlreadyInDb if the graph
already exists on the object. 
</returns>

</member>
<member name="M:AcDbEvalGraph.removeGraph(AcDbObject*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="742">
<summary>
Removes the graph, if one exists, at the supplied key. The object must
be database resident. 
</summary>

<param name="pObj">
Object from which to remove the graph.
</param>
<param name="pKey">
Key at which the graph is associated on the object. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if the
graph does not exist.
</returns>

</member>
<member name="M:AcDbEvalGraph.hasGraph(AcDbDatabase*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="761">
<summary>
Determines if a graph exists at the supplied key in the databae.
</summary>

<param name="pDb">
The database from which to retrieve the graph.
</param>
<param name="pKey">
The key at which the graph is registered in the database.
</param>

<returns>
Returns true if the graph exists.
</returns>

</member>
<member name="M:AcDbEvalGraph.getGraph(AcDbDatabase*,System.Char!System.Runtime.CompilerServices.IsConst*,AcDbEvalGraph**,AcDb.OpenMode!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\objectarx\inc\dbeval.h" line="779">
<summary>
Retrieves the graph from the database. This method
provides the ability to associate a graph with a database
(instead of a  specific object in the database).
</summary>

<param name="pDb">
Database from which to retrieve the graph.
</param>
<param name="pKey">
Key at which the graph is associated.
</param>
<param name="pGraph">
The graph at the specified key, or NULL if the graph does not exist.
</param>
<param name="mode">
The mode (read/write) in which to return the graph.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if the
specified key could not be found. 
</returns>

<remarks>
The calling application is responsible for calling close() on the
returned graph when it is no longer needed. 
</remarks>

</member>
<member name="M:AcDbEvalGraph.createGraph(AcDbDatabase*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="813">
<summary>
Creates a graph at the specified key for the database. This method
provides the ability to associate a graph witha  database (instead of a
specific object in the database).
</summary>

<param name="pDb">
Database from which to create the graph.
</param>
<param name="pKey">
Key at which the graph is associated.
</param>

<returns>
Returns Acad::eOk if successful.
</returns>

</member>
<member name="M:AcDbEvalGraph.removeGraph(AcDbDatabase*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="833">
<summary>
Removes a graph at the specified key for the database.
</summary>

<param name="pDb">
Database from which to remove the graph.
</param>
<param name="pKey">
Key at which the graph is associated.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if there is
no graph with that key associated to the database 
</returns>
</member>
<!-- 丢弃成员“M:AcDbEvalGraph.replaceGraph(AcDbObject*,System.Char!System.Runtime.CompilerServices.IsConst*,AcDbObjectId)”的格式错误的 XML 文档注释。 -->
<member name="M:AcDbEvalGraph.addNode(AcDbEvalExpr*,System.UInt32!System.Runtime.CompilerServices.IsLong*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="888">
<summary>
Adds a node to the graph and returns the AcDbEvalNodeId of the newly
added node. 
</summary>

<param name="pNode">
A pointer to the node to add to the graph.
</param>
<param name="id">
The id of newly added node. 
</param>

<returns>
Acad::eOk if successful.
</returns>

<remarks>
If the graph is database-resident the caller must call close() on
<c>pNode</c> when it is no longer needed. 
</remarks>

</member>
<member name="M:AcDbEvalGraph.removeNode(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="912">
<summary>
Removes a node from the graph. 
</summary>

<param name="id">
The id of the node to remove from the graph. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if no
node with the specified id exists in the graph.
</returns>

</member>
<member name="M:AcDbEvalGraph.removeNode(AcDbEvalExpr*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="928">
<summary>
Removes a node from the graph. Assumes the object is already opened
 for read or write.
</summary>

<param name="pNode">
The node to remove from the graph.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound
if the node does not exist in the graph.
</returns>

</member>
<member name="M:AcDbEvalGraph.getAllNodes(AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="945">
<summary>
Returns an array of all node ids contained in the graph.
</summary>

<param name="nodes">
An array of AcDbEvalNodeId objects for all of the nodes in the graph.
</param>

<returns>
Returns Acad::eOk if successful. 
</returns>

</member>
<member name="M:AcDbEvalGraph.getNode(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDb.OpenMode,AcDbObject**)" decl="true" source="c:\objectarx\inc\dbeval.h" line="959">
<summary>
Opens a node in the graph given its node id. 
</summary>

<param name="nodeId">
The AcDbEvalNodeId of the node to open.
</param>
<param name="mode">
The AcDb::OpenMode to open the node with.
</param>
<param name="ppNode">
A pointer to the opened node. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if no
node with the specified id exists in the graph. 
</returns>

<remarks>
Callers must call close() on the returned node pointer when it is no
longer needed.
</remarks>
</member>
<member name="M:AcDbEvalGraph.addEdge(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="986">
<summary>
Adds a non-invertable edge between two nodes in the graph.
</summary>

<param name="idFrom">
The AcDbEvalNodeId of the node from which the edge originates.
</param>
<param name="idTo">
The AcDbEvalNodeId of the node at which the edge terminates. 
</param>

<returns> 
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if
either of the nodes are not resident in the graph. 
</returns>

</member>
<member name="M:AcDbEvalGraph.addEdge(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1004">
<summary>
Adds an edge between two nodes in the graph.
</summary>

<param name="idFrom">
The AcDbEvalNodeId of the node from which the edge originates.
</param>
<param name="idTo">
The AcDbEvalNodeId of the node at which the edge terminates. 
</param>
<param name="bInvertible">
True if the edge can be inverted depending on which of the nodes 
has been activated. 
</param>

<returns> 
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if
either of the nodes are not resident in the graph. 
</returns>

</member>
<member name="M:AcDbEvalGraph.removeEdge(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1028">
<summary>
Removes an edge between to nodes in the graph.
</summary>

<param name="idFrom">
The AcDbEvalNodeId of the node from which the edge originates.
</param>
<param name="idTo">
The AcDbEvalNodeId of the node at which the edge terminates. 
</param>

<returns> 
Returns Acad::eOk if successful. Returns Acad::eGraphEdgeNotFound if
an edge between the nodes does not exist.
</returns>

</member>
<member name="M:AcDbEvalGraph.getIncomingEdges(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbEvalEdgeInfo**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1047">
<summary>
Returns a list of incoming edges to a node in the graph.
</summary>

<param name="nodeId">
The AcDbEvalNodeId of the node to retrieve incoming edges for.
</param>
<param name="edges">
An array of AcDbEvalEdgeInfo objects describing incoming edges for the
node. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if
the node with the specified id does not exist in the graph.
</returns>

</member>
<member name="M:AcDbEvalGraph.getOutgoingEdges(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbEvalEdgeInfo**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1067">
<summary>
Returns a list of outgoing edges from a node in the graph.
</summary>

<param name="nodeId">
The AcDbEvalNodeId of the node to retrieve outgoing edges for.
</param>
<param name="edges">
An array of AcDbEvalEdgeInfo objects describing outgoing edges for the
node. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if
the node with the specified id does not exist in the graph.
</returns>

</member>
<member name="M:AcDbEvalGraph.getEdgeInfo(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbEvalEdgeInfo*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1087">
<summary>
Returns information about an edge between two nodes in a graph. 
</summary>

<param name="nodeFrom">
The AcDbEvalNodeId of the orginating node for the edge.
</param>
<param name="nodeTo">
The AcDbEvalNodeId of the destination node for the edge.
</param>
<param name="einfo">
An AcDbEvalEdgeInfo object describing the edge. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound if
either of the nodes with the specified id does not exist in the graph.
Returns Acad::eGraphEdgeNotFound if edge exists between the nodes. 
</returns>
</member>
<member name="M:AcDbEvalGraph.addGraph(AcDbEvalGraph*,AcDbEvalIdMap**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1110">
<summary>
Adds the nodes from one graph to another graph by moving the nodes and
edges from the source graph to this graph.
</summary>

<param name="pGraphToAdd">
The graph containing the nodes and edges to add to this graph.
</param>

<param name="idMap">
Pointer to output map from old node ids within 'pGraphToAdd' to their 
new ids within this graph.  
</param>

<returns>
Returns Acad::eOk if successful. 
</returns>

<remarks> 
All nodes and edges in <paramref name="pGraphToAdd"/> are moved to the
destination graph. The argument graph is emptied as as result
of the operation.
</remarks>

</member>
<member name="M:AcDbEvalGraph.evaluate" decl="true" source="c:\objectarx\inc\dbeval.h" line="1139">
<summary>
Evaluates the class by traversing the graph and invoking
<c>AcDbEvalExpr::evaluate()</c> on all of the visited nodes. 
</summary>

<returns>
Returns Acad::eOk if succssful. If any of the calls to
<c>AcDbEvalExpr::evaluate()</c> fails the error returned by
<c>AcDbEvalExpr::evaluate()</c> is returned by this method.
</returns>

<remarks>
Applications must first activate one or more nodes in the graph by 
calling <c>AcDbEvalGraph::activatedNodes()</c> before calling this
method. 
</remarks>

</member>
<member name="M:AcDbEvalGraph.evaluate(AcDbEvalContext!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1158">
<summary>
Evaluates the class by traversing the graph and invoking
<c>AcDbEvalExpr::evaluate()</c> on all of the visited nodes. 
</summary>

<param name="pContext">
A pointer to an AcDbEvalContext object that will be passed to each node
as it is visited when calling its <c>AcDbEvalExpr::evaluate()</c>
method. 
</param>

<returns>
Returns Acad::eOk if succssful. If any of the calls to
<c>AcDbEvalExpr::evaluate()</c> fails the error returned by
<c>AcDbEvalExpr::evaluate()</c> is returned by this method.
</returns>

<remarks>
Applications must first activate one or more nodes in the graph by 
calling <c>AcDbEvalGraph::activatedNodes()</c> before calling this
method. 
</remarks>

</member>
<member name="M:AcDbEvalGraph.evaluate(AcDbEvalContext!System.Runtime.CompilerServices.IsConst*,AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1184">
<summary>
Evaluates the class by traversing the graph and invoking
<c>AcDbEvalExpr::evaluate()</c> on all of the visited nodes. 
</summary>

<param name="pContext">
A pointer to an AcDbEvalContext object that will be passed to each node
as it is visited when calling its <c>AcDbEvalExpr::evaluate()</c>
method. 
</param>
<param name="activatedNodes">
An array of AcDbEvalNodeIds to activate when performing the evaluation. 
</param>

<returns>
Returns Acad::eOk if succssful. If any of the calls to
<c>AcDbEvalExpr::evaluate()</c> fails the error returned by
<c>AcDbEvalExpr::evaluate()</c> is returned by this method.
</returns>

<remarks>
Applications may activate and evaulate nodes in one step by providing a
non-null <paramref name="activatedNodes"/> array pointer. Otherwise
applications must first activate one or more nodes in the graph by
calling <c>AcDbEvalGraph::activatedNodes()</c> before calling this
method. 
</remarks>

</member>
<member name="M:AcDbEvalGraph.activate(AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1216">
<summary>
Activates a collection of nodes in a graph.
</summary>

<param name="activatedNodes">
An array of AcDbEvalNodeIds of the nodes in the graph to activate. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphCyclesFound if the 
node activation resulted in a cyclic graph. 
</returns>

<remarks>
Applications must activate nodes in a graph before calling
<c>AcDbEvalGraph::evaluate()</c>. Active nodes are used as the starting
point for the directed traversal of the graph during graph evaluation. 
 
If activatedNodes is empty, all the nodes in the graph are deactivated.
</remarks>

</member>
<member name="M:AcDbEvalGraph.activate(AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1240">
<summary>
Activates a collection of nodes in a graph.
</summary>

<param name="activatedNodes">
An array of AcDbEvalNodeIds of the nodes in the graph to activate. 
</param>
<param name="pActiveSubgraph">
An array of the nodes that would be visited given the activated nodes.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphCyclesFound if the 
node activation resulted in a cyclic graph. 
</returns>

<remarks>
Applications must activate nodes in a graph before calling
<c>AcDbEvalGraph::evaluate()</c>. Active nodes are used as the starting
point for the directed traversal of the graph during graph evaluation. 
 
If activatedNodes is empty, all the nodes in the graph are deactivated.
</remarks>

</member>
<member name="M:AcDbEvalGraph.activate(AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;*,AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1268">
<summary>
Activates a collection of nodes in a graph.
</summary>

<param name="activatedNodes">
An array of AcDbEvalNodeIds of the nodes in the graph to activate. 
</param>
<param name="pActiveSubgraph">
An array of the nodes that would be visited given the activated nodes.
</param>
<param name="pCycleNodes">
An array of the nodes that are cyclic given the activated nodes.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphCyclesFound if the 
node activation resulted in a cyclic graph. 
</returns>

<remarks>
Applications must activate nodes in a graph before calling
<c>AcDbEvalGraph::evaluate()</c>. Active nodes are used as the starting
point for the directed traversal of the graph during graph evaluation. 
 
If activatedNodes is empty, all the nodes in the graph are deactivated.
</remarks>

</member>
<member name="M:AcDbEvalGraph.getIsActive(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1300">
<summary>
Determines whether the specified node is activated in the graph.
</summary>

<param name="id">
The AcDbEvalNodeId of a node in the graph.
</param>
<param name="bIsActive">
True if the specified node exists in the graph and is active, false
otherwise.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eGraphNodeNotFound no
node with the specified id exists in the graph. 
</returns>

</member>
<member name="M:AcDbEvalGraph.equals(AcDbEvalGraph!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1320">
<summary>
Determines whether two graphs are 'equal' with equality defined
as Graph A equals Graph B if A is a subgraph of B and B is a subgraph
of A - where 'is a subgraph' is defined by the isSubgraphOf() method
below.
</summary>

<param name="pOther">
The graph to be tested for equality with
</param>

<returns>
true if the graphs are equal. 
</returns>

</member>
<member name="M:AcDbEvalGraph.isSubgraphOf(AcDbEvalGraph!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1337">
<summary>
Determines whether the 'this' graph is a subgraph of the graph 
passed in as an argument. 'A is a subgraph of B' is defined by
considering of mapping of nodes from A to B map(node) where the
nodeId of node in A is the same as the nodeId of the node
map(node) in B. If no such mapping exists, A is not a subgraph of
B.
If such a mapping exists - the order and types of both the
incoming and outgoing edges from nodes in A have to be a subset of 
the incoming and outgoing edges for each of the mapped nodes in B.
If this is true, A is a subgraph of B. If not, A is not a subgraph 
of B.

</summary>

<param name="pOther">
The graph to be tested against being a subgraph of.
</param>

<returns>
true if 'this' is a subgraph of 'pOther'
</returns>

</member>
<member name="M:AcDbEvalGraph.postInDatabase(AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1363">
<summary>
Adds this graph to the database, giving it a 
handle and an object ID. 
The new object ID is returned in the objId argument.
All of this graph's nodes are added to the database and 
this graph is made their owner.
This function does not establish ownership of this graph.
</summary>

<param name="objId">
Output new object ID obtained by this function.
</param>

<param name="pDb">
The destination database.
</param>

<returns>
Returns Acad::eOk if successful.
</returns>

</member>
<member name="T:AcDbEvalEdgeInfo" decl="false" source="c:\objectarx\inc\dbeval.h" line="1393">
<summary>
Utility class that holds directed edge information between two nodes in an
AcDbEvalGraph. Instances of this class are returned by calls to edge methods
on AcDbEvalGraph. 
</summary>

<seealso cref="!:AcDbEvalGraph.getIncomingEdges"/>
<seealso cref="!:AcDbEvalGraph.getOutgoingEdges"/>
<seealso cref="!:AcDbEvalGraph.getEdgeInfo"/>

</member>
<member name="M:AcDbEvalEdgeInfo.#ctor" decl="false" source="c:\objectarx\inc\dbeval.h" line="1407">
<summary>
Constructor.
Adesk::UInt32 </summary>
</member>
<member name="M:AcDbEvalEdgeInfo.#ctor(System.UInt32!System.Runtime.CompilerServices.IsLong,System.UInt32!System.Runtime.CompilerServices.IsLong,System.Int32!System.Runtime.CompilerServices.IsLong,System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="false" source="c:\objectarx\inc\dbeval.h" line="1417">
<summary>
Constructor.
</summary>

<param name="from">
The graph node id of the node from which this edge originates. 
</param>
<param name="to">
The graph node id of the node at which this edge terminates. 
</param>
<param name="flags">
Description to come.
</param>
<param name="count">
Description to come. 
</param>
</member>
<member name="M:AcDbEvalEdgeInfo.from" decl="true" source="c:\objectarx\inc\dbeval.h" line="1440">
<summary>
The originating node of the edge.
</summary>

<returns>
The edge's originating node id. 
</returns>
</member>
<member name="M:AcDbEvalEdgeInfo.to" decl="true" source="c:\objectarx\inc\dbeval.h" line="1449">
<summary>
The terminal node of the edge.
</summary>

<returns>
The edge's terminating node id. 
</returns>
</member>
<member name="M:AcDbEvalEdgeInfo.refCount" decl="true" source="c:\objectarx\inc\dbeval.h" line="1458">
<summary>
Description to come.
</summary>

<returns>
Description to come.
</returns>

</member>
<member name="M:AcDbEvalEdgeInfo.isInvertible" decl="true" source="c:\objectarx\inc\dbeval.h" line="1468">
<summary> 
Indicates whether the edge is invertable, i.e. whether the originating
and terminating nodes can be swapped depending on which of the nodes is
activated.
</summary>

<returns>
Returns true if the edge is invertable. 
</returns>
</member>
<member name="M:AcDbEvalEdgeInfo.isSuppressed" decl="true" source="c:\objectarx\inc\dbeval.h" line="1479">
<summary>
Tests whether an edge is suppressed, i.e. temporarily considered
'removed' from the graph during activation and/or evaluation.
This flag applies only to an invertible pair of edges, where
during activation one of the directions are 'active' and the
complementary one 'suppressed'
</summary>

<returns>
true if the edge is active.
</returns>

</member>
<member name="M:AcDbEvalEdgeInfo.op_Equality(AcDbEvalEdgeInfo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1493">
<summary>
Member wise equality
</summary>

<param name="other">
Item to be tested against for equality.
</param>

<returns>
true if the two items are equal
</returns>

</member>
<member name="T:AcDbEvalExpr" decl="false" source="c:\objectarx\inc\dbeval.h" line="1519">
<summary> 
This class represents a single node in an AcDbEvalGraph. The node
represents an action (or "expression"). The owning graph calls the node's
evaluate() method when visiting the node during a traversal of the graph
from within the graph's evaluate().
</summary>
</member>
<member name="M:AcDbEvalExpr.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="1531">
<summary>
Default constructor.
</summary>

</member>
<member name="M:AcDbEvalExpr.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="1537">
<summary>
Destructor. 
</summary>

</member>
<member name="M:AcDbEvalExpr.getGraph(AcDbEvalGraph**,AcDb.OpenMode)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1545">
<summary>
Returns a pointer to the graph owning the node. 
</summary>

<param name="pGraph">
Pointer to the graph owning the node. 
</param>
<param name="mode">
The AcDb::OpenMode to open the owning graph with. 
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eNulNodeId if the node
is not graph-resident. 
</returns>

<remarks>
The caller is responsible for calling <c>close</c> on the returned
graph pointer. 
</remarks>

</member>
<member name="M:AcDbEvalExpr.nodeId" decl="true" source="c:\objectarx\inc\dbeval.h" line="1569">
<summary>
Returns the id of the node. 
</summary>

<returns> 
The ID of the node if it is graph-resident. Returns AcDbGraph::kNullId
if the node is not graph-resident.
</returns>

<remarks>
When a node is added to a graph it is assigned an ID that is unique
among all nodes in the graph. If the node is not graph-resident the id
will be AcDbEvalGraph::kNullNodeId;
</remarks>

</member>
<member name="M:AcDbEvalExpr.addedToGraph(AcDbEvalGraph*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1588">
<summary>
Called when a node is added to a graph.
</summary>

<param name="pGraph">
A pointer to the graph the node is added to.
</param>

<remarks>
AcDbEvalGraph::addNode() calls this method on the node after it has
been added to the graph. 
</remarks>

</member>
<member name="M:AcDbEvalExpr.removedFromGraph(AcDbEvalGraph*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1603">
<summary>
Called when a node is removed from a graph.
</summary>

<param name="pGraph">
A pointer to the graph the node is removed from.
</param>

<remarks>
AcDbEvalGraph::removeNode() calls this method on the node after it has
been removed from the graph.
</remarks>

</member>
<member name="M:AcDbEvalExpr.adjacentNodeRemoved(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1618">
<summary>
Called when a node with a shared edge to this node is removed from the
graph.
</summary>

<param name="adjNodeId">
The AcDbEvalNodeId of the removed node.
</param>

<remarks>
AcDbEvalGraph::removeNode() calls this method on nodes with shared
edges to the node being removed. 
</remarks>

</member>
<member name="M:AcDbEvalExpr.adjacentEdgeRemoved(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1634">
<summary>
Called when an edge on the node is removed. 
</summary>

<param name="adjEdgeNodeId">
The AcDbEvalNodeId of the node whose shared edge is being removed. 
</param>

<remarks>
AcDbEvalGraph::removeEdge() calls this method on node at either end of
the edge being removed.
</remarks>
</member>
<member name="M:AcDbEvalExpr.adjacentEdgeAdded(System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1648">
<summary>
Called when an edge is added.
</summary>

<param name="fromId">
The from AcDbEvalNodeId of the node whose shared edge is being 
removed. 
</param>
 
<param name="toId">
The to AcDbEvalNodeId of the node whose shared edge is being 
removed. 
</param>
 
<param name="bIsInvertible">
Whether the edge is invertible or not.
</param>

<remarks>
Both the AcDbEvalGraph::addEdge() methods calls this method on each
of the nodes at either end of the edge being added. So, when adding an
invertible edge, for example, Four notifications will occur.
</remarks>

</member>
<member name="M:AcDbEvalExpr.movedFromGraph(AcDbEvalGraph*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1676">
<summary>
Called when a node is about to be moved from pFromGraph to another
graph.
</summary>

<param name="pFromGraph">
The the graph from which the node is being transplanted from.
</param>

<remarks>
AcDbEvalGraph::addGraph() calls this method on the node
just before it is added to the destination graph.
</remarks>

</member>
<member name="M:AcDbEvalExpr.movedIntoGraph(AcDbEvalGraph*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1692">
<summary>
Called when a node is done being moved from pFromGraph to another
graph.
</summary>

<param name="pIntoGraph">
The the graph into which the node is being transplanted to.
</param>

<remarks>
AcDbEvalGraph::addGraph() calls this method on the node
just after it is added to the destination graph.
Since addGraph() copies a disjoint subgraph into the destination
graph, the newly added subgraph is isomorphic to the source
graph in the addGraph operation.
</remarks>

</member>
<member name="M:AcDbEvalExpr.remappedNodeIds(AcDbEvalIdMap*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1712">
<summary>
Called exactly once for each node in a graph after all nodes 
in a graph had their ids changed.
</summary>

<param name="idMap">
Map from old node ids within 'pGraphToAdd' to their new ids within
this graph.  Should be empty initially and be the size of the number
of nodes on successful return.
</param>

<remarks>
AcDbEvalGraph::addGraph() calls this method on each node in the
to-be-added graph just after after all nodes have been added to the 
destination graph.
The default behavior is to do nothing.  Some subclasses of 
AcDbEvalExpr should override this function to update
their references to other nodes.
Nodes should not alter the map.
</remarks>

</member>
<member name="M:AcDbEvalExpr.copiedIntoGraph(AcDbEvalGraph*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1735">
<summary>
Called when a node is done being inserted due to a copy
operation from one graph to another.
</summary>

<param name="pIntoGraph">
The the graph into which the node is being added to.
</param>

<remarks>
AcDbEvalGraph::copyFrom() calls this method on the nodes
that are copies from the argument graph nodes. Since all the
nodes from the argument graph, as well as their edges are copied,
the graph structure in 'this' becomes isomorphic to the 
graph structure in the source graph.
</remarks>

</member>
<member name="M:AcDbEvalExpr.isActivatable" decl="true" source="c:\objectarx\inc\dbeval.h" line="1754">
<summary>
Returns whether this node should be actived
</summary>

<remarks>
This method allows a node to indicate that its active() method should
not be called directly.  The default implementation is to return true,
nodes are by default activatable.
</remarks>

</member>
<member name="M:AcDbEvalExpr.activated(AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1766">
<summary>
Called on graph resident nodes that become active. 
</summary>

<param name="argumentActiveList">
An array of AcDbEvalNodeIds of the nodes being activated in the graph.
</param>

<remarks>
This method is called by AcDbEvalGraph::activate(), or by
AcDbEvalGraph::evaluate() when it is called with a non-null node
activation arrray, on every node being activated by the call. 
</remarks>

</member>
<member name="M:AcDbEvalExpr.graphEvalStart(System.Boolean)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1782">
<summary>
Called on graph resident nodes before traversing the graph in a call to
AcDbEvalGraph::evaluate().
</summary>

<param name="bNodeIsActive">
True if the node has been activated for the traversal.
</param>

<remarks>
This method is called by AcDbEvalGraph::evaluate() for nodes that will
be traversed during the graph evaluation.
</remarks>

</member>
<member name="M:AcDbEvalExpr.graphEvalEnd(System.Boolean)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1798">
<summary>
Called on graph resident nodes after traversing the graph in a call to
AcDbEvalGraph::evaluate().
</summary>

<param name="bNodeIsActive">
True if the node has been activated for the traversal.
</param>

<remarks>
This method is called by AcDbEvalGraph::evaluate() for nodes that were
visited during the taversal of the graph.
</remarks>

</member>
<member name="M:AcDbEvalExpr.graphEvalAbort(System.Boolean)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1814">
<summary>
Called on graph resident nodes after aborting the traversal of the
graph in a call to AcDbEvalGraph::evaluate().
</summary>

<param name="bNodeIsActive">
True if the node has been activated for the traversal.
</param>

<remarks>
This method is called by AcDbEvalGraph::evaluate() for nodes that were
in the traversal list of an aborted graph evaluation. 
</remarks>

</member>
<member name="M:AcDbEvalExpr.evaluate(AcDbEvalContext!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1832">
<summary>
Causes the expression represented by the node to be evaluated. Called
by for a graph-resident node when the node is visited during a call to
<c>AcDbEvalGraph::evaluate()</c>
</summary>

<param name="ctxt">
A pointer to the AcDbEvalContext object used for the graph evaluation.
May be NULL.
</param>

<returns>
Returns Acad::eOk if successful. Any non successful result terminates
the graph traversal.
</returns>

<remarks>
The default implementation does nothing and returns Acad::eOk.
</remarks>

</member>
<member name="M:AcDbEvalExpr.equals(AcDbEvalExpr!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1855">
<summary>
Determines if two AcDbEvalExprs are equal. The default
implementation is to check that the concrete class types
are the same, i.e. this-&gt;isA() == pOther-&gt;isA().
</summary>

<param name="pOther">
Argument to be tested for equality against.
</param>

<returns>
true if the objects are equal. 
</returns>

</member>
<member name="M:AcDbEvalExpr.value" decl="true" source="c:\objectarx\inc\dbeval.h" line="1873">
<summary>
The value of the variant node. 
</summary>

<returns> 
An AcDbEvalVariant representing the value of the evaluated expression.
</returns>

<remarks>
The value is usually updated during the <c>AcDbEvalExpr::evaluate()</c>
call. The default value is uninitialized
(<c>AcDbEvalVariant::Type::kNone</c>).
</remarks>

</member>
<member name="M:AcDbEvalExpr.postInDatabase(AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1889">
<summary>
Adds this object to the database, giving it a 
handle and an object ID. 
The new object ID is returned in the objId argument.
This function does not establish ownership of this object.
Subclasses with child objects should override this
function to add them to the database at this time and
establish ownership.
</summary>

<param name="objId">
Output new object ID obtained by this function.
</param>

<param name="pDb">
The destination database.
</param>

<returns>
Returns Acad::eOk if successful.
</returns>

</member>
<member name="F:AcDbEvalExpr.m_lastValue" decl="false" source="c:\objectarx\inc\dbeval.h" line="1914">
<summary>
The value of the expression. <seealso cref="M:AcDbEvalExpr.value"/>.
</summary>

<remarks>
The default implementation does not persist this value, nor does it
ever update it from its initialized value
(<c>AcDbEvalVaraint::Type::kNone</c>).
</remarks>

</member>
<member name="T:AcDbEvalConnectable" decl="false" source="c:\objectarx\inc\dbeval.h" line="1933">
<summary>
This class implements a runtime inspection interface for named properties
on AcDbEvalExpr objects. Objects implementing this class expose a
collection of named, typed properties and semantics for "connecting"
properties between AcDbEvalGraph resident connectable instances. 
</summary>

</member>
<member name="M:AcDbEvalConnectable.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="1945">
<summary>
Destructor.
</summary>

</member>
<member name="M:AcDbEvalConnectable.getConnectionNames(AcArray&lt;AcString,AcArrayObjectCopyReallocator&lt;AcString&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1953">
<summary>
Returns an array of named connections.
</summary>

<param name="names">
Returned array of named connections. 
</param>

<returns>
Acad::eOk if successful.
</returns>

</member>
<member name="M:AcDbEvalConnectable.hasConnectionNamed(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1967">
<summary>
Tests whether an object exposes a connection.
</summary>

<param name="name">
The name of the connection to test for.
</param>

<returns>
True if a connection with the specified name exists.
</returns>

</member>
<member name="M:AcDbEvalConnectable.getConnectionType(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDb.DwgDataType*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="1981">
<summary>
Returns the <c>AcDbEvalVariant::Type</c> of a named connection.
</summary>

<param name="name">
The name of the connection to return the type of.
</param>
<param name="type">
The type of the named connection.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if no
connection with the specified name exists. 
</returns>

</member>
<member name="M:AcDbEvalConnectable.getConnectionValue(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbEvalVariant*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2003">
<summary>
Returns the value of a named connection.
</summary>

<param name="name">
The name of the connection to return the value of. 
</param>
<param name="value">
The value of the named connection.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if no
connection with the specified name exists. 
</returns>

</member>
<member name="M:AcDbEvalConnectable.setConnectionValue(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2023">
<summary>
Sets the value of a named connection.
</summary>

<param name="name">
The name of the connection to set the value of. 
</param>
<param name="value">
The new value of the named connection.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if no
connection with the specified name exists. 
</returns>
</member>
<member name="M:AcDbEvalConnectable.connectTo(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst,AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2042">
<summary>
Connects a named connection on this object to a connection on
another AcDbEvalConnectable. Both objects must be graph-resident.
</summary>

<param name="thisConnection">
The name of the connection on this object.
</param>
<param name="sourceConnectableId">
The AcDbEvalNodeId of the other connectable.
</param>
<param name="sourceConnectionName">
The name of the connection on the other connectable.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if either
object does not expose its respective named connection. 
</returns>

</member>
<member name="M:AcDbEvalConnectable.disconnectFrom(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst,AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2067">
<summary>
Disconnects a named connection on this object from a connection on
another AcDbEvalConnectable. Both objects must be graph-resident.
</summary>

<param name="thisConnection">
The name of the connection on this object.
</param>
<param name="sourceConnectableId">
The AcDbEvalNodeId of the other connectable.
</param>
<param name="sourceConnectionName">
The name of the connection on the other connectable.
</param>

<returns>
Returns Acad::eOk if successful. Returns Acad::eKeyNotFound if either
object does not expose its respective named connection. 
</returns>

</member>
<member name="M:AcDbEvalConnectable.connectionAllowed(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst,AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2092">
<summary>
Determines whether a connection is allowed between to objects.
</summary>

<param name="thisConnection">
The name of the connection on this object.
</param>
<param name="sourceConnectableId">
The AcDbEvalNodeId of the other connectable.
</param>
<param name="sourceConnectionName">
The name of the connection on the other connectable.
</param>

<returns>
Returns Acad::eOk if the connection is allowed. Returns
Acad::eKeyNotFound if either object does not expose its respective
named connection. 
</returns>

</member>
<member name="M:AcDbEvalConnectable.getConnectedObjects(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;System.UInt32!System.Runtime.CompilerServices.IsLong&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2119">
<summary>
Returns a list objects connected to an exposed connection.
</summary>

<param name="thisConnection">
The name of the connection on this object.
</param>
<param name="connectedObjects">
An array of AcDbEvalNodeIds of objects connected to the exposed
connection.
</param>

<returns>
Returns Acad::eOk if the connection is allowed. Returns
Acad::eKeyNotFound if the object does not expose the named connection. 
</returns>

</member>
<!-- 丢弃成员“M:AcDbEvalConnectable.getConnectedNames(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsLong!System.Runtime.CompilerServices.IsConst,AcArray<AcString,AcArrayObjectCopyReallocator<AcString>>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)”的格式错误的 XML 文档注释。 -->
<member name="M:AcDbEvalConnectable.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="2167">
<summary>
Default constructor.
</summary>

</member>
<member name="T:AcDbEvalContext" decl="false" source="c:\objectarx\inc\dbeval.h" line="2179">
<summary>
This class implements a simple container for application data that can be
used during the evaluation of an AcDbEvalGraph. The graph passes any
AcDbEvalContext object supplied in a call to
<c>AcDbEvalGraph::evaluate()</c> to each node in the graph when calling
<c>AcDbEvalExpr::evaluate()</c> during the ensuing traversal. Graph client
applications typically use the context to store application-specific data
used by custom nodes during their evaluation. 
</summary>


</member>
<member name="M:AcDbEvalContext.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="2193">
<summary>
Default constructor.
</summary>

</member>
<member name="M:AcDbEvalContext.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="2199">
<summary>
Destructor.
</summary>

</member>
<member name="M:AcDbEvalContext.insertAt(AcDbEvalContextPair!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2209">
<summary>
Inserts an AcDbEvalContextPair into the context. 
</summary>

<param name="pair">
The AcDbEvalContextPair to insert into the context.
</param>

<remarks>
If an AcDbEvalContextPair with the specified key already exists it is
replaced with the new pair.
</remarks>
</member>
<member name="M:AcDbEvalContext.removeAt(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2223">
<summary>
Removes an AcDbEvalContextPair from the context. 
</summary>

<param name="szKey">
The key of the AcDbEvalContextPair to remove from the context.
</param>

</member>
<!-- 丢弃成员“M:AcDbEvalContext.getAt(AcDbEvalContextPair*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)”的格式错误的 XML 文档注释。 -->
<member name="M:AcDbEvalContext.newIterator" decl="true" source="c:\objectarx\inc\dbeval.h" line="2254">
<summary>
Returns a new AcDbEvalContextIterator for the context.
</summary>

<returns>
A new AcDbEvalContextIterator. Callers must delete the iterator when it
is no longer needed by calling <c>delete</c>.
</returns>

</member>
<member name="T:AcDbEvalContextPair" decl="false" source="c:\objectarx\inc\dbeval.h" line="2275">
<summary>
The AcDbEvalContextPair class represents a single entry in an
AcDbEvalContext container. 
</summary>

<remarks>
This is a simple key-value pair stored in an AcDbEvalContext. The values
are void pointers. Neither this class nor the AcDbEvalContext class are
responsible for managing the memory allocated to the values stored in the
context. 
</remarks>

</member>
<member name="M:AcDbEvalContextPair.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="2290">
<summary>
Default constructor.
</summary>

</member>
<member name="M:AcDbEvalContextPair.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*,System.Void*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2296">
<summary>
Constructor.
</summary>

<param name="szKey">
The key used to lookup the pair in an AcDbEvalContext.
</param>
<param name="pValue">
A pointer to the data stored in the context pair. 
</param>

</member>
<member name="M:AcDbEvalContextPair.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="2309">
<summary>
Destructor.
</summary>

</member>
<member name="M:AcDbEvalContextPair.setKey(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2315">
<summary>
Sets the key used to lookup the pair in an AcDbEvalContext.
</summary>

<param name="szKey">
The key used to lookup the pair in an AcDbEvalContext.
</param>

</member>
<member name="M:AcDbEvalContextPair.key" decl="true" source="c:\objectarx\inc\dbeval.h" line="2325">
<summary>
Gets the key used to lookup the pair in an AcDbEvalContext.
</summary>

<returns>
The key used to lookup the pair in an AcDbEvalContext.
</returns>

</member>
<member name="M:AcDbEvalContextPair.setValue(System.Void*)" decl="true" source="c:\objectarx\inc\dbeval.h" line="2335">
<summary>
Sets the values stored with the pair in an AcDbEvalContext.
</summary>

<param name="pValue">
The value to store in the AcDbEvalContextPair.
</param>

<remarks>
The memory pointed to by <paramref name="pValue"/> must be allocated and
freed by the caller. 
</remarks>
</member>
<member name="M:AcDbEvalContextPair.value" decl="true" source="c:\objectarx\inc\dbeval.h" line="2349">
<summary>
Gets the values stored with the pair in an AcDbEvalContext.
</summary>

<returns>
The value stored in the AcDbEvalContextPair.
</returns>

</member>
<member name="T:AcDbEvalContextIterator" decl="false" source="c:\objectarx\inc\dbeval.h" line="2369">
<summary>
Provides access to the contents of an AcDbEvalContext collection.
</summary>

<remarks>
AcDbEvalContextIterator instances are returned by calls to AcDbEvalContext::newIterator().
</remarks>

</member>
<member name="M:AcDbEvalContextIterator.#ctor" decl="true" source="c:\objectarx\inc\dbeval.h" line="2380">
<summary>
Default constructor.
</summary>

</member>
<member name="M:AcDbEvalContextIterator.Dispose" decl="true" source="c:\objectarx\inc\dbeval.h" line="2386">
<summary>
Destructor.
</summary>

</member>
<member name="M:AcDbEvalContextIterator.start" decl="true" source="c:\objectarx\inc\dbeval.h" line="2394">
<summary>
Initializes the iterator to the start of the collection.
</summary>

</member>
<member name="M:AcDbEvalContextIterator.next" decl="true" source="c:\objectarx\inc\dbeval.h" line="2400">
<summary>
Advances the iterator to the next object in the collection.
</summary>

<returns>
Returns true when the iterator has reached the end of the collection.
</returns>

</member>
<member name="M:AcDbEvalContextIterator.done" decl="true" source="c:\objectarx\inc\dbeval.h" line="2410">
<summary>
Determines whether the iterator has reached the end of the collection.
</summary>

<returns>
Returns true if the iterator has reached the end of the collection.
</returns>

</member>
<member name="M:AcDbEvalContextIterator.contextPair" decl="true" source="c:\objectarx\inc\dbeval.h" line="2420">
<summary>
Returns the AcDbEvalContextPair at the current iterator position.
</summary>

<returns>
The AcDbEvalContextPair at the current iterator position.
</returns>
</member>
<member name="T:AcDbDynBlockReferenceProperty" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="39">
<summary>
A utility class describing a property on a dynamic block, including getting
and setting the current value on the dynamic block. The
AcDbDynBlockReferenceProperty class is a reference to a property defined on
a dynamic block instance, and can be used to get and set the current value
on that instance.
</summary>

</member>
<member name="T:AcDbDynBlockReferenceProperty.UnitsType" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="51">
<summary>
Describes the units (if any) of the property. Clients may use this
information to format the property in their user interface. 
</summary>
</member>
<member name="F:kNoUnits" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="57">
<summary>
No units defined.
</summary>
</member>
<member name="F:kAngular" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="62">
<summary>
Property represents and angle between two vectors.
</summary>
</member>
<member name="F:kDistance" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="67">
<summary>
Property represents a distance between two points.
</summary>
</member>
<member name="F:kArea" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="72">
<summary>
Property represents a two-dimensional area.
</summary>
</member>
<member name="M:AcDbDynBlockReferenceProperty.#ctor" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="78">
<summary>
Default constructor.
</summary>
</member>
<member name="M:AcDbDynBlockReferenceProperty.Dispose" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="83">
<summary>
Destructor.
</summary>
</member>
<member name="M:AcDbDynBlockReferenceProperty.#ctor(AcDbDynBlockReferenceProperty!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="88">
<summary>
Copy constructor.
</summary>

<param name="other">
The dynamic block property to construct a copy of.
</param>
</member>
<member name="M:AcDbDynBlockReferenceProperty.op_Assign(AcDbDynBlockReferenceProperty!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="97">
<summary>
Assignment operator.
</summary>

<param name="other">
The dynamic block property to assign this property to.
</param>

<remarks>
The assignment operator causes the dynamic property object to reference
the same property as that it is being assigned to, that is a named
property on a dynamic block instance. The actual property value is not
changed. 
</remarks>
</member>
<member name="M:AcDbDynBlockReferenceProperty.blockId" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="114">
<summary>
The AcDbObjectId of the dynamic block reference containing the property.
</summary>

<returns>
Returns the AcDbObjectId of the dynamic block reference containing the
property represented by the AcDbDynBlockReferenceProperty.
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.propertyName" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="124">
<summary>
The property name.
</summary>

<returns>
The name of the property as an AcString.
</returns>

<remarks>
Property names are guaranteed to be unique amongst all properties on a
given block reference. 
</remarks>
</member>
<member name="M:AcDbDynBlockReferenceProperty.propertyType" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="138">
<summary>
The property type.
</summary>

<returns>
The value type of the property.
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.readOnly" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="147">
<summary>
Whether the property is read-only.
</summary>

<returns>
Returns true if the property value can be changed by calls to
<c>setValue()</c>.
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.show" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="157">
<summary>
Whether the property is displayed by Property Palette when the block
reference containing the property is selected.
</summary>

<returns>
Returns true if the property is displayed by Property Palette when the
block reference containing the property is selected. 
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.visibleInCurrentVisibilityState" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="168">
<summary>
Whether the property is visible in the current visibility state.
</summary>

<returns>
Returns true if the property is visible in the current visibility state. 
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.description" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="178">
<summary>
The property description.
</summary>

<returns>
An property description as an AcString object.
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.unitsType" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="187">
<summary>
The units of the property.
</summary>

<returns>
The units of the property in the form of a UnitsType enumeration.
</returns>

<remarks>
Clients may use this information to format the property consistently in
their user interface.
</remarks>
</member>
<member name="M:AcDbDynBlockReferenceProperty.getAllowedValues(AcArray&lt;AcDbEvalVariant,AcArrayObjectCopyReallocator&lt;AcDbEvalVariant&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="201">
<summary>
Returns the allowed values for the property.
</summary>

<param name="values">
An AcDbEvalVariantArray that upon a successful return is populated with
the allowed property values. 
</param>

<returns>
Returns Acad::eOk if successful.
</returns>

<remarks>
Not all dynamic block properties have a restricted set of property
values. Some properties are unrestricted, some a mimimum or maximum
value (or both), and some have a list of allowed values. This function
only returns a non-empty <paramref name="values"/> array when the
allowed property values are defined by a list. Mimimum, maximum, and
unrestricted property types are not supported by this method.
</remarks>
</member>
<member name="M:AcDbDynBlockReferenceProperty.value" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="224">
<summary>
The current value of the property on the block.
</summary>

<returns>
Returns the current value of the property as an AcDbEvalVariant.
</returns>
</member>
<member name="M:AcDbDynBlockReferenceProperty.setValue(AcDbEvalVariant!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="233">
<summary>
Sets the current value of the property on the block.
</summary>

<param name="value">
The new value to assign to the parameter.
</param>

<returns>
Returns Acad::eOk if the parameter exists and the block can be modified. 
</returns>

<remarks>
Note that there is no error returned if the specified property value
could not be set, for example if the property has a list of allowable
values or a minimum-maximum range and the value provided is not in the
list or is out of range. In this case the method succeeds but no error
is returned. 
</remarks>
</member>
<member name="M:AcDbDynBlockReferenceProperty.op_Equality(AcDbDynBlockReferenceProperty!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="254">
<summary>
Compare whether these two properties belongs to the same block reference
</summary>
</member>
<member name="T:AcDbDynBlockReference" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="271">
<summary>
A utility class for accessing information about block references to dynamic
blocks.
</summary>

</member>
<member name="M:AcDbDynBlockReference.#ctor(AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="280">
<summary>
Constructor.
</summary>

<param name="blockRefId">
The AcDbObjectId of the AcDbBlockReference to get dynamic block
information from.
</param>
</member>
<member name="M:AcDbDynBlockReference.#ctor(AcDbBlockReference*)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="290">
<summary>
Constructor.
</summary>

<param name="blockRef">
A pointer to the AcDbBlockReference to get dynamic block
information from.
</param>

<remarks>
For internal use only.
</remarks>
</member>
<member name="M:AcDbDynBlockReference.Dispose" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="304">
<summary>
Destructor.
</summary>
</member>
<member name="M:AcDbDynBlockReference.isDynamicBlock(AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="309">
<summary>
Static method for determining whether an AcDbBlockTableRecord contains
dynamic block information.
</summary>

<param name="blockTableRecordId">
The AcDbObjectId of an AcDbBlockTableRecord.
</param>

<returns>
Returns true if <paramref name="blockTableRecordId"/> is an
AcDbBlockTableRecord and contains dynamic block information.
</returns>
</member>
<member name="M:AcDbDynBlockReference.isDynamicBlock" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="324">
<summary>
Determines whether the AcDbBlockReference passed to the class
constructor contains dynamic block information.
</summary>

<returns>
Returns true if the AcDbBlockReference passed to the class constructor
contains dynamic block information. 
</returns>
</member>
<member name="M:AcDbDynBlockReference.blockId" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="335">
<summary> 
The AcDbObjectId of the block reference.
</summary>

<returns>
Returns the AcDbObjectId of the block reference.
</returns>
</member>
<member name="M:AcDbDynBlockReference.getBlockProperties(AcArray&lt;AcDbDynBlockReferenceProperty,AcArrayObjectCopyReallocator&lt;AcDbDynBlockReferenceProperty&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="344">
<summary>
Returns a collection of AcDbDynBlockReferenceProperty instances
referencing dynamic block properties on the AcDbBlockReference.
</summary>

<param name="properties">
Returned collection of AcDbDynBlockReferenceProperty instances.
</param>

<remarks>
If the AcDbBlockReference contains no dynamic property information the
returned array is empty.
</remarks>
</member>
<member name="M:AcDbDynBlockReference.resetBlock" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="360">
<summary>
Resets the AcDbBlockReference to the default state of the dynamic
block.
</summary>

<returns>
Returns Acad::eOk if successful.
</returns>

<remarks>
All properties on the AcDbBlockReference are set to match the values in
the block definition.  
</remarks>
</member>
<member name="M:AcDbDynBlockReference.convertToStaticBlock" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="375">
<summary>
Converts the dynamic block instance to a legacy (non-dynamic) 
anonymous block.
</summary>

<returns>
Returns Acad::eOk if successful.
</returns>

<remarks>
When successful the block reference "freezes" the dynamic block
properties at their current values and ceases to become a dynamic
block. It becomes an anonymous block for all purposes.
</remarks>
</member>
<member name="M:AcDbDynBlockReference.convertToStaticBlock(AcString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="391">
<summary>
Converts the dynamic block instance to a legacy (non-dynamic) block.
</summary>

<param name="newBlockName">
The name of the new block definition.
</param>

<returns>
Returns Acad::eOk if successful.
</returns>

<remarks>
When successful the block the dynamic block properties are "frozen" at
their current values and the reference ceases to become a dynamic
block. A new block is defined with the name 
<paramref name="newBlockName"/>, which must not already exist in the 
drawing and must satisfy all of the naming restrictions of normal block
references.
</remarks>
</member>
<member name="M:AcDbDynBlockReference.dynamicBlockTableRecord" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="413">
<summary>
The dynamic block definition.
</summary>

<returns>
Returns the AcDbObjectId of the dynamic block definition (an
AcDbBlockTableRecord) if the block reference is a dynamic block,
otherwise it returns AcDbObjectId::kNull.
</returns>
</member>
<member name="M:AcDbDynBlockReference.anonymousBlockTableRecord" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="424">
<summary>
The anonymous block definition used to draw the dynamic block.
</summary>

<returns>
Returns the AcDbObjectId of the anonymous block definition (an
AcDbBlockTableRecord) used to draw the block reference. Returns
AcDbObjectId::kNull if the block reference is not a dynamic block or is
not currently using an anonymous block to draw itself.
</returns>

<remarks>
Dynamic blocks whose properties differ from that of the dynamic block
definition may use an anonymous block to draw themselves. This
anonymous block may be shared between multiple block references and
should not be modified by client applications directly. 
</remarks>

</member>
<member name="T:AcDbDynBlockTableRecord" decl="false" source="c:\objectarx\inc\dbdynblk.h" line="450">
<summary>
A utility class for accessing information about dynamic block definitions
and managing the associated anonymous blocks.  
</summary>

</member>
<member name="M:AcDbDynBlockTableRecord.#ctor(AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="459">
<summary>
Constructor.
</summary>

<param name="blockTableRecordId">
The AcDbObjectId of the AcDbBlockTableRecord to get dynamic block
information from.
</param>
</member>
<member name="M:AcDbDynBlockTableRecord.Dispose" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="469">
<summary>
Destructor.
</summary>
</member>
<member name="M:AcDbDynBlockTableRecord.isDynamicBlock" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="474">
<summary>
Determines whether the AcDbBlockTableRecord passed to the class
constructor contains dynamic block information.
</summary>

<returns>
Returns true if the AcDbBlockTableRecord passed to the class constructor
contains dynamic block information. 
</returns>
</member>
<member name="M:AcDbDynBlockTableRecord.blockTableRecordId" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="485">
<summary> 
The AcDbObjectId of the block table record.
</summary>

<returns>
Returns the AcDbObjectId of the block table record. 
</returns>
</member>
<member name="M:AcDbDynBlockTableRecord.getAnonymousBlockIds(AcArray&lt;AcDbObjectId&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="494">
<summary> 
Obtains the list of anonymous blocks created from the dynamic block
definition.
</summary>

<param name="anonymousIds">
Array populated with the AcDbObjectIds of the anonymous blocks created
from the dynamic block definition. 
</param>

<returns>
Returns Acad::eOk if successful.
</returns>

<remarks>
AutoCAD creates and manages anonymous blocks by deep cloning the
contents of a dynamic block definition when a reference to the
definition needs a modified copy of the block geometry. 
</remarks>
</member>
<member name="M:AcDbDynBlockTableRecord.updateAnonymousBlocks" decl="true" source="c:\objectarx\inc\dbdynblk.h" line="516">
<summary>
Updates the anonymous blocks created from this dynamic block definition
to reflect any changes made to the dynamic block definition. 
</summary>

<returns>
Returns Acad::eOk if successful.
</returns>

<remarks>
Calling this method after updating a dynamic block definition causes
AutoCAD to replace all anonymous block definitions created from this
definition with new anonymous block definitions, thereby causing all
references to reflect changes made to the dynamic block. The update
preserves the values of dynamic block properties on the references
where possible, adding newly created properties and deleting properties
that no longer exist. When complete all references to the dynamic block
reflect the new state of the block definition. 
</remarks>
</member>
<member name="F:kDLFNoType" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="23">
<summary>
No typeit button. This bit is obsolete.
</summary>
</member>
<member name="F:kDLFPut" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="27">
<summary>
Creating file
</summary>
</member>
<member name="F:kDLFDwg" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="31">
<summary>
Special action for drawing file
</summary>
</member>
<member name="F:kDLFPathOnly" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="35">
<summary>
Default name is path only
</summary>
</member>
<member name="F:kDLFNoWarn" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="39">
<summary>
No overwrite warning on Put file
</summary>
</member>
<member name="F:kDLFNoExistOk" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="43">
<summary>
Don't check if file exists in Open dialog
</summary>
</member>
<member name="F:kDLFAnyExt" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="47">
<summary>
Accept any extension, don't strip
</summary>
</member>
<member name="F:kDLFRqBox" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="51">
<summary>
User requested dialogue box via ~
</summary>
</member>
<member name="F:kDLFSaveas" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="55">
<summary>
SAVEAS use of the dialog. Distinguish .dwg action
</summary>
</member>
<member name="F:kDLFNoLib" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="59">
<summary>
Don't perform library search
</summary>
</member>
<member name="F:kDLFNoXfer" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="63">
<summary>
Internet: do not transfer file
</summary>
</member>
<member name="F:kDLFNoURLs" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="67">
<summary>
Internet: do not allow URLs at all
</summary>
</member>
<member name="F:kDLFDwgDef" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="71">
<summary>
Default is derived from DWG name
</summary>
</member>
<member name="F:kDLFOpenDef" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="75">
<summary>
Special dialog definition for OPEN
</summary>
</member>
<member name="F:kDLFDvc" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="79">
<summary>
Allow device names to be returned
</summary>
</member>
<member name="F:kDLFDwt" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="83">
<summary>
Flag templates to lock directories
</summary>
</member>
<member name="F:kDLFOpts" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="87">
<summary>
Display the "Options" item
</summary>
</member>
<member name="F:kDLFNoPopup" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="91">
<summary>
Don't use last pop-up as the parent window
</summary>
</member>
<member name="F:kDLFFrcWarn" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="95">
<summary>
Force overwrite warning in scripts and Lisp
</summary>
</member>
<member name="F:kDLFMulti" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="99">
<summary>
Allow multiple drawing opens.

WARNING: This flag must not be used in any AutoCAD command
dialogs other then the OPEN command.  It is ok to use it for
non-AutoCAD command dialogs.  For example, it is used in the
acedGetFileNavDialog API to allow multiple file selection and
return multiple file names to the caller.
</summary>
</member>
<member name="F:kDLFCLI" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="109">
<summary>
Use the command line to get file name.
</summary>
</member>
<member name="F:kDLFRecover" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="113">
<summary>
Doing a recover.
</summary>
</member>
<member name="F:kDLFForceDir" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="117">
<summary>
Force the initial directory to be the argument (only works with anav).
</summary>
</member>
<member name="F:kDLFNoFTP" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="121">
<summary>
Do not show FTP site (only works with anav).
</summary>
</member>
<member name="F:kDLFNoAnav" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="125">
<summary>
Do not use the anav dialog, force use of Microsoft common file dialog.
</summary>
</member>
<member name="F:kDLFFolders" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="129">
<summary>
Select folders only (only works with anav).
</summary>
</member>
<member name="F:kDLFNoExtensions" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="133">
<summary>
Do not show shell namespace extension sites at all (only works with anav).
</summary>
</member>
<member name="F:kDLFNoTemplate" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="137">
<summary>
Open with no Template - Imperial or Metric
</summary>
</member>
<member name="F:kDLFExport" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="141">
<summary>
AutoCAD EXPORT dialog. Distinguish 2ddwf and 3ddwf action
</summary>
</member>
<member name="F:kDLFEnableRememberFolders" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="145">
<summary>
Enable support for REMEMBERFOLDERS sysvar
</summary>
</member>
<member name="F:kDLFOpenSample" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="149">
<summary>
Open dialog but for opening local/Online sample files.
</summary>
</member>
<member name="F:kDLFUseCloud" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="153">
<summary>
Force the intial directory to the Autodesk Cloud (only works with anav).
</summary>
</member>
<member name="F:kDLFCloudControls" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="157">
<summary>
Control display on the right side of dialog.
</summary>
</member>
<member name="T:AcFileSelectFlags" decl="false" source="c:\objectarx\inc\acdlflagbits.h" line="14">
<summary>
These enum values are used as flags bits in the nFlags argument of
AcDbHostApplicationServices::selectFile(). Some of them are used by
AutoCAD's calls to selectFile() and should not be used by other
callers.  They are included here because they may be seen by
selectFile callback handlers (see
AcadHostApplicationServices::registerSelectFileCallback()).
</summary>
</member>
<member name="F:kIsUpToDateAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="83">
<summary> Everything is in sync. </summary> 
</member>
<member name="F:kChangedDirectlyAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="86">
<summary> Explicitly changed (such as by the user). </summary> 
</member>
<member name="F:kChangedTransitivelyAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="89">
<summary> Changed indirectly due to something else changed. </summary> 
</member>
<member name="F:kChangedNoDifferenceAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="92">
<summary> No real change, only forces to evaluate. </summary> 
</member>
<member name="F:kFailedToEvaluateAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="95">
<summary> Action failed to evaluate but evaluation continues. 
Otherwise identical to kIsUpToDateAssocStatus. </summary> 
</member>
<member name="F:kErasedAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="99">
<summary> Dependent-on object erased or action is to be erased. </summary> 
</member>
<member name="F:kSuppressedAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="102">
<summary> Action evaluation suppressed, treated as if evaluated. </summary> 
</member>
<member name="F:kUnresolvedAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="105">
<summary> Dependent-on object is un-resolved (e.g the xref is unloaded). </summary> 
</member>
<member name="T:AcDbAssocStatus" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="75">
<summary>
The status of AcDbAssocActions and AcDbAssocDependencies. In case of an
action it relates to the action itself, in case of a dependency it relates
to the object the dependency depends on.
</summary>

</member>
<member name="M:evaluationRequestSeverityLevel(AcDbAssocStatus)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="110">
<summary>
Returns the severity level (positive integer) of those status values that
indicate a request for an AcDbAssocAction or an AcDbAssocDependency to be
evaluated, or 0 if the status does not indicate an evaluation request.
Higher numbers mean more "severe" requests to evaluate.
</summary>
<param name="status"> The AcDbAssocStatus. </param>
<returns> 
Evaluation request severity level (positive integer) if or 0 if not a 
request to evaluate.
</returns>

</member>
<member name="M:isEvaluationRequest(AcDbAssocStatus)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="138">
<summary>
Returns true for the AcDbAssocStatus values that are a request for an 
AcDbAssocAction or AcDbAssocDependency to be evaluated, and false for 
other AcDbAssocStatus values.
</summary>
<param name="status"> The AcDbAssocStatus. </param>
<returns> 
Returns true iff the value of the AcDbAssocStatus indicates that an 
AcDbAssocAction or AcDbAssocDependency needs to be evaluated.
</returns>

</member>
<member name="M:isToBeSkipped(AcDbAssocStatus)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="155">
<summary>
Returns true iff the AcDbAssocStatus indicates that the action or dependency 
should be skipped and treated as it it were not there.
</summary>
<param name="status"> The AcDbAssocStatus. </param>
<returns> 
Returns true iff the AcDbAssocStatus indicates that the action or dependency 
should be skipped and treated as it it were not there.
</returns>

</member>
<member name="F:kCannotBeEvaluatedAssocEvaluationPriority" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="182">
<summary> Default "can not be evaluated" priority. </summary>
</member>
<member name="F:kCannotDermineAssocEvaluationPriority" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="185">
<summary> The action evaluatability cannot be determined at this time. </summary>
</member>
<member name="F:kCanBeEvaluatedAssocEvaluationPriority" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="188">
<summary> Default "can be evaluated" priority. </summary>
</member>
<member name="T:AcDbAssocEvaluationPriority" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="171">
<summary>
Negative numbers mean that an AcDbAssocAction cannot be evaluated at this 
time, positive numbers mean that the action can now be evaluated. Higher 
positive priority numbers mean that the action should be evaluated sooner, 
ahead of actions with lower positive priority. The negative numbers mean 
how much the action cannot be evaluated. The smaller the number, the less 
the action can be evaluated.
</summary>

</member>
<member name="F:kModifyObjectsAssocEvaluationMode" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="200">
<summary> <para> 
The standard action evaluation mode in which the objects the action 
depends-on via write-dependencies are modified so that they satisfy 
the requirements imposed on them by the action. 
</para> <para>
If this cannot be achieved, the action needs to report an error and 
set its status to kFailedToEvaluateAssocStatus or possibly to 
kErasedAssocStatus (if it wants itself to be erased.)
</para> </summary>

</member>
<member name="F:kModifyActionAssocEvaluationMode" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="212">
<summary> <para> 
The action evaluation mode in which the action is modified so that it 
satisfies the objects the action depends on. The objects are not 
modified, the internal data in the action or its dependencies are. An
example is an AcDbAssoc2dConstraintGroup action that may remove the 
constraints that are not satisfied by the current geometry configuration.
</para> <para>
If this cannot be achieved, the action needs to report an error and 
set its status to kFailedToEvaluateAssocStatus or possibly to 
kErasedAssocStatus (if it wants itself to be erased.)
</para> </summary>

</member>
<member name="T:AcDbAssocEvaluationMode" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="193">
<summary>
At the beginning of AcDbAssocActionBody::evaluateOverride() implementation, 
the custom code needs to query the mode in which it should evaluate itself. 
</summary>

</member>
<member name="F:kNotDraggingAssocDraggingState" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="236">
<summary> Not inside the dragging loop. </summary>
</member>
<member name="F:kFirstSampleAssocDraggingState" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="239">
<summary> The first drag sample of the dragging loop. </summary>
</member>
<member name="F:kIntermediateSampleAssocDraggingState" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="242">
<summary> An intemediate drag sample of the dragging loop. </summary>
</member>
<member name="F:kLastSampleAssocDraggingState" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="245">
<summary> The last drag sample of the dragging loop. </summary>
</member>
<member name="T:AcDbAssocDraggingState" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="228">
<summary>
While in the middle of evaluation, the action may inquire the client code 
whether the evaluation is happening from inside of the dragging loop and 
at which stage the dragging is.
</summary>

</member>
<member name="F:kNotSpecified" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="258">
<summary> Transformation type not specified. </summary>
</member>
<member name="F:kStretch" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="261">
<summary> Geometries have been changed through strech command. </summary>
</member>
<member name="F:kRotate" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="264">
<summary> Geometries have been changed through rotate command. </summary>
</member>
<member name="F:kMove" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="267">
<summary> Geometries have been changed through move command. </summary>
</member>
<member name="T:AcDbAssocTransformationType" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="250">
<summary>
Information about what type of transformation (which AutoCAD command) has 
been performed with the entities before the actions that have dependencies
on these entities are evaluated.
</summary>

</member>
<member name="T:AcDbAssocEvaluationCallback" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="272">
<summary> <para>
A mechanism for AcDbAssocActions to notify about the progress of evaluation, 
to report success or failure, notify about which objects the action is
going to use and modify, to allow the evaluation to be cancelled by the
client, etc.
</para> <para>
Pointer to an object of AcDbAssocEvaluationCallback class in a mandatory
argument to the AcDbAssocAction::evaluate() method. AcDbAssocManager manages 
an ordered collection of global AcDbAssocEvaluationCallbacks grouped in an
AcDbAssocEvaluationMultiCallback. AcDbAssocManager::evaluateTopLevelNetwork() 
passes this multi-callback to the AcDbAssocAction::evaluate() method of the 
top-level network.
</para> </summary>

</member>
<member name="M:AcDbAssocEvaluationCallback.#ctor" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="290">
<summary> Default constructor. </summary>
</member>
<member name="M:AcDbAssocEvaluationCallback.Dispose" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="293">
<summary> Virtual destructor. </summary>
</member>
<member name="M:AcDbAssocEvaluationCallback.evaluationMode" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="296">
<summary> 
The action needs to call this method at the beginning of the evaluate()
code to obtain the mode in which it should evaluate itself. 
The default implementation returns kModifyObjectsEvaluationMode.
</summary>
<returns> The requested evaluation mode. </returns>

</member>
<member name="M:AcDbAssocEvaluationCallback.beginActionEvaluation(AcDbAssocAction*)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="305">
<summary> 
The action informs that it is starting its evaluation. This callback 
is issued at the beginning of AcDbAssocAction::evaluate() call 
and should not be issued from the individual evaluateOverride() method 
calls. The action is open for write when this callback is issued.
</summary>
<param name="pAction"> The action that is being evaluated. </param>

</member>
<member name="M:AcDbAssocEvaluationCallback.endActionEvaluation(AcDbAssocAction*)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="315">
<summary> 
The action informs that it has finished its evaluation. This callback
is issued at the end of AcDbAssocAction::evaluate() call 
and should not be issued from the individual evaluate() method calls.
The action is open for write when this callback is issued.
</summary>
<param name="pAction"> The action that is being evaluated. </param>

</member>
<member name="M:AcDbAssocEvaluationCallback.setActionEvaluationErrorStatus(AcDbAssocAction*,Acad.ErrorStatus,AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbObject*,System.Void*)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="325">
<summary> 
The action informs that an error happened during its evaluation. It does
not need to inform if no error happened. The action may also inform about 
which object caused the failure, giving its id, pointer or both, and 
provide arbitrary additional info.
</summary>
<param name="pAction"> The action that is being evaluated. </param>
<param name="errorStatus"> Action evaluation error status. </param>
<param name="objectId"> The failed object id (such as of an AcDbAssocDependency). </param>
<param name="pObject"> The failed object pointer (such as of an AcDbAssocDependency). </param>
<param name="pErrorInfo"> Additional info about the error. </param>

</member>
<member name="M:AcDbAssocEvaluationCallback.beginActionEvaluationUsingObject(AcDbAssocAction*,AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,System.Boolean,AcDbObject**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="343">
<summary> <para>
The action informs that it is going to use or modify an AcDbObject. The 
action issues this callback just before it opens the object for read or 
write. 
<para> </para>
The custom evaluation callback code may pass back a pointer to a 
substitute AcDbObject. If it happens, the action should use or modify this 
substitute object instead of the original object. The substitute object 
is expected to already be correctly open for read or write (if it is a 
database-resident object), the action does not need to open or close it. 
Also, the substitute object may possibly be a non-database-resident 
object and the action should be ok with it.
<para> </para>
This allows the custom evaluation callback code to redirect the action 
evaluation to use or modify other objects than the action depends on. 
A common example is dragging, when the action may be redirected to use 
and modify temporary non-database resident clones of the original objects. 
The custom evaluation callback code creates non-database resident clones 
of any relevant AcDbEnities when notified by the action that the action 
is going to modify them, and the action then modifies these temporary 
clones. The modified clones are then drawn and discarded, the original 
objects remain untouched. 
<para> </para>
There is an AcDbAssocObjectPointer template class that is
modelled after AcDbObjectPointer template class and that simplifies
the client action evaluation code that needs to perform this redirection.
The AcDbAssocObjectPointer constructor automatically calls
the beginActionEvaluationUsingObject() method and the destructor calls
the endActionEvaluationUsingObject() method. All the client code needs
to do is to use this template class and then use the AcDbObject pointer
this template class provides. The pointer will point either to the 
original database-resident object or to the substitute object, if the 
evaluation is in progress and the client evaluation callback provided 
a substitute object.
</para> </summary>
<param name="pAction"> The action that is being evaluated. </param>
<param name="objectId"> The AcDbObject that is going to be used or modified by the action. </param>
<param name="objectIsGoingToBeUsed"> The object contents is going to be used. </param>
<param name="objectIsGoingToBeModified"> The object contents is going to be modified. </param>
<param name="pSubstituteObject"> 
An AcDbObject optionally provided by the custom evaluation callback code. 
The custom evaluation callback code should not assign NULL to this output 
argument if it does not want to provide a substitute object. It should 
only assign a non-NULL pointer if it intends to provide a substitute object.
</param>

</member>
<member name="M:AcDbAssocEvaluationCallback.endActionEvaluationUsingObject(AcDbAssocAction*,AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbObject*)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="396">
<summary> 
The action informs that it is done with using or modifying an AcDbObject. 
The action issues this callback just before it closes the object. If the 
object is a substitute object provided by the client code, the action 
does not close it.
</summary>
<param name="pAction"> The action that is being evaluated. </param>
<param name="objectId"> 
The same AcDbObjectId that has been previously passed to the matching
beginActionEvaluationUsingObject() callback.
</param>
<param name="pObject"> 
The object that has been used or modified by the action. It may be NULL
if the original object couldn't be opened or if the substitute object 
was not of the expected type.
</param>

</member>
<member name="M:AcDbAssocEvaluationCallback.allDependentActionsMarkedToEvaluate(AcDbAssocNetwork*)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="417">
<summary> <para>
Called during the network evaluation to notify that all actions that need to
be evaluated have been marked to evaluate. This concludes the first phase of
the evaluation process. After this notification all the marked actions are 
then sequentially evaluated. 
</para><para>
The notification is only issued once, for the top-level network that is being 
evaluated, not for the individual subnetworks of the top-level network.
</para></summary>
<param name="pNetwork"> AcDbAssocNetwork whose all actions that need to 
be evaluated have been marked to evaluate. 
</param>

</member>
<member name="M:AcDbAssocEvaluationCallback.draggingState" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="432">
<summary> 
The action may inquire the client code whether the evaluation is 
happening from inside of the dragging loop and at which stage the 
dragging is. The custom evaluation callback code may provide this 
information by implementing this callback.
</summary>
<returns> Returns the dragging state. </returns>

</member>
<member name="M:AcDbAssocEvaluationCallback.cancelActionEvaluation" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="442">
<summary> <para>
The custom evaluation callback code can request that the action evaluation 
should be cancelled by implementing this callback predicate. The 
AcDbAssocAction::evaluate() method checks this predicate just after 
issuing the beginActionEvaluation() callback, i.e. just before the action 
evaluateOverride() method is called. If a whole associative network is 
evaluated, this predicate is also checked after evaluating each action 
in the network to see if the network evaluation should continue. Custom 
actions can freely add their own calls to check this predicate, 
particularly if the action evaluation is time consuming. 
</para> <para>
Once this predicate returns true, requesting the evaluation to be 
cancelled, it should keep returning true, to make sure the evaluation
of the whole associative network is cancelled.
</para> <para>
When the evaluation is cancelled, the status of the not-yet evaluated 
actions/networks stays unchanged. The status of the actions/networks 
that have already been evaluated also stays unchanged, i.e. there is no
roll-back of the already made changes. 
</para> <para>
This predicate should be used to cancel the evaluation of the whole
associative network, not to selectively control the evaluation of the
individual actions. To selectively enable/disable the evaluation of 
individual actions, the beginActionEvaluation() callback can bse used. 
Inside this callback the client code can change the status of the action 
being evaluated to a status that is not an evaluation request, such as 
change it to kSuppressedAssocStatus, kFailedToEvaluateAssocStatus, 
kIsUpToDateAssocStatus, and the action is then not going to be evaluated.
</para> </summary>
<returns> Returns true iff the evaluation should be cancelled. </returns>

</member>
<member name="M:AcDbAssocEvaluationCallback.getAdditionalData" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="475">
<summary> 
Allows the custom evaluation callback code to pass arbitrary data 
to the actions that are being evaluated. The default implementation 
returns NULL.
</summary> 
<returns> Pointer to AcDbEvalContext or NULL. </returns>

</member>
<member name="M:AcDbAssocEvaluationCallback.getTransformationType" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="484">
<summary> 
Allows the custom evaluation callback code to pass information about what 
type of transformation (which AutoCAD command) has been performed with 
the entities prior to action evaluation. The default implementation 
returns kNotSpecified.
</summary> 
<returns> AcDbAssocTransformationType. </returns>

</member>
<member name="M:isDraggingProvidingSubstituteObjects(AcDbAssocEvaluationCallback!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="497">
<summary>
Returns true iff in the middle of dragging and the AcDbAssocDraggingState 
indicates that the dragger is providing substitute non-database resident
objects that are clones of the original database-resident objects.
</summary>
<param name="pEvaluationCallback"> 
The current AcDbAssocEvaluationCallback. NULL pointer is allowed.
</param>

</member>
<member name="T:AcDbActionsToEvaluateCallback" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="518">
<summary>
This callback is used by AcDbAssocAction::getDependentActionsToEvaluate() 
method to inform about other actions, dependencies or arbitrary objects that 
should also be evaluated because they depend on the given action that is to 
be evaluated.
</summary>

</member>
<member name="M:AcDbActionsToEvaluateCallback.#ctor" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="528">
<summary> Default constructor. </summary>
</member>
<member name="M:AcDbActionsToEvaluateCallback.Dispose" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="531">
<summary> Virtual destructor. </summary>
</member>
<member name="M:AcDbActionsToEvaluateCallback.needsToEvaluate(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbAssocStatus,System.Boolean)" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="534">
<summary> <para>
This callback method is called by AcDbAssocAction::getDependentActionsToEvaluate().
It is a mechanism by which getDependentActionsToEvaluate() informs that 
an AcDbAssocAction, AcDbAssocDependency, or an AcDbObject needs to be 
evaluated and suggests new status for them that the callback implementation 
should set. If the given AcDbObjectId is not of an action or of a dependency, 
but of an arbitrary AcDbObject, the callback implementation should simply 
recursively call needsToEvaluate() for all dependencies on that object.
</para> <para>
This callback does not need to be implemented by the client code. The 
Associative Framework evaluation mechanism provides a default implementation 
that it uses when calculating a transitive closure of all actions that 
need to be evaluated.
</para> </summary>
<param name="objectId"> 
AcDbObjectId of an AcDbAssocAction, AcDbAssocDependency or an arbitrary 
AcDbObject that needs to be evaluated. 
</param>
<param name="newStatus"> 
The new evaluation request status of the action or dependency. If it
is not an evaluation request, the needsToEvaluate() implementation 
should not change the status of the action or dependency.
</param>
<param name="ownedActionsAlso"> 
If the action that needs to evaluate is an AcDbAssocNetwork, this argument
controls whether all the actions owned by the network also need to be 
evaluated. The caller usually passes true.
</param>

</member>
<member name="F:kAcDbAssocCreateImpObject" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="589">
<summary> The API class should create the corresponding imp object. </summary> 
</member>
<member name="F:kAcDbAssocDoNotCreateImpObject" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="592">
<summary> The API class should not create the corresponding imp object. </summary> 
</member>
<member name="T:AcDbAssocCreateImpObject" decl="false" source="c:\objectarx\inc\acdbassocglobal.h" line="570">
<summary> <para> 
This is mostly for internal use.
</para> <para>
A way to tell the API class constructor whether it should create the 
corresponding imp object derived from AcDbImpObject, or whether the derived 
API class constructor is going to create its derived imp object.
</para> <para>
When the base class constructor is called from the derived class 
constructor, the AcDbAssocCreateImpObject argument should be passed as 
kAcDbAssocDoNotCreateImpObject so that the base class does not create an 
imp object, the derived class constructor will create its own derived-class 
imp object. When the base class constructor is called by client code in 
order to create a concrete object, the AcDbAssocCreateImpObject argument 
should be passed as kAcDbAssocCreateImpObject, or omitted, and the constructor
will then create the corresponding imp object.
</para> </summary>

</member>
<member name="T:AcDbCompoundObjectId" decl="false" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="26">
<summary><para>
Class used to identify an AcDbObject in an AcDbDatabase when the object is
references via a path of AcDbBlockReferences, and possibly by some other
ways in the future. The object may reside in the host database (the same 
database as the AcDbCompoundObjectId belongs to) or it may reside in an XREF
database or even in an unrelated database.
</para><para>
Notice that if the AcDbCompoundObjectId references an object in another 
database, reactors will be created to keep tract of relevant events happening 
to the database, such as database deletion or XREF unload/reload.
</para></summary> 

</member>
<member name="M:AcDbCompoundObjectId.#ctor" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="43">
<summary> 
The default constructor creates an empty AcDbCompoundObjectId.
</summary> 

</member>
<member name="M:AcDbCompoundObjectId.#ctor(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="49">
<summary> 
Creates AcDbCompoundObjectId from an ordinary AcDbObjectId. If the
host database is null, the host database is obtained from the given 
AcDbObjectId. Even if it is in XREF database, the database hosting the 
XREF is obtained.
</summary>
<param name="id"> AcDbObjectId of the AcDbObject that this AcDbCompoundObjectId 
is going to reference. </param>
<param name="pHostDatabase"> The host database. If null, the database 
is taken from the AcDbObjectId (even if it is in XREF database). </param>

</member>
<member name="M:AcDbCompoundObjectId.#ctor(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="62">
<summary> Copy constructor. </summary> 

</member>
<member name="M:AcDbCompoundObjectId.#ctor(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="66">
<summary> 
Creates AcDbCompoundObjectId from an ordinary AcDbObjectId and a path
of AcDbBlockReferences. If the host database is null, the host database 
is obtained from the first id in the path. Even if it is in XREF database, 
the database hosting the XREF is obtained.
</summary>
<param name="id"> AcDbObjectId of the AcDbObject that this AcDbCompoundObjectId 
is going to reference. </param>
<param name="path"> The path of AcDbBlockRefrences that lead to the
referenced object. The first AcDbBlockReference in the path resides in the 
host database, the second AcDbBlockReference is from the AcDbBlockTableRecord
that the first AcDbBlockReference references, the third AcDbBlockReference 
is from the AcDbBlockTableRecord that the second AcDbBlockReference 
references, etc. </param>
<param name="pHostDatabase"> The host database. If null, the database 
is taken from the first AcDbBlockReference id in the path (even if it is 
in XREF database). </param>

</member>
<member name="M:AcDbCompoundObjectId.topId" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="94">
<summary> Returns the first AcDbObjectId (of an AcDbBlockReference) 
in the path, or the leaf-node AcDbObjectId, if there is no path.
</summary>

</member>
<member name="M:AcDbCompoundObjectId.leafId" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="100">
<summary> Returns the leaf-node AcDbObjectId that resides in the 
AcDbBlockTableRecord that the last AcDbBlockReference in the path references, 
or simply the AcDbObjectId if there is no path. 
</summary>

</member>
<member name="M:AcDbCompoundObjectId.getFullPath(AcArray&lt;AcDbObjectId&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="107">
<summary> Returns the full path, i.e. the given path of AcDbBlockReference
ids appended with the leaf AcDbObjectId.
</summary>

</member>
<member name="M:AcDbCompoundObjectId.getPath(AcArray&lt;AcDbObjectId&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="113">
<summary> Returns the AcDbBlockReference path. </summary>

</member>
<member name="M:AcDbCompoundObjectId.setEmpty" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="117">
<summary> Sets the AcDbCompoundObjectId to be empty, containing no data. </summary>

</member>
<member name="M:AcDbCompoundObjectId.set(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="121">
<summary> 
Sets this AcDbCompoundObjectId from an ordinary AcDbObjectId. If the
host database is null, the host database is obtained from the given 
AcDbObjectId. Even if it is in XREF database, the database hosting the 
XREF is obtained.
</summary>
<param name="id"> AcDbObjectId of the AcDbObject that this AcDbCompoundObjectId 
is going to reference. </param>
<param name="pHostDatabase"> The host database. If null, the database 
is taken from the AcDbObjectId (even if it is in XREF database). </param>

</member>
<member name="M:AcDbCompoundObjectId.set(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="134">
<summary> Sets this AcDbCompoundObjectId from another AcDbCompoundObjectId. </summary>

</member>
<member name="M:AcDbCompoundObjectId.set(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="138">
<summary> 
Sets this AcDbCompoundObjectId from an ordinary AcDbObjectId and a path
of AcDbBlockReferences. If the host database is null, the host database 
is obtained from the first id in the path. Even if it is in XREF database, 
the database hosting the XREF is obtained.
</summary>
<param name="id"> AcDbObjectId of the AcDbObject that this AcDbCompoundObjectId 
is going to reference. </param>
<param name="path"> The path of AcDbBlockRefrences that lead to the
referenced object. The first AcDbBlockRefrence in the path resides in the 
host database, the second AcDbBlockReference is from the AcDbBlockTableRecord
that the first AcDbBlockReference references, the third AcDbBlockReference 
is from the AcDbBlockTableRecord that the second AcDbBlockReference 
references, etc. </param>
<param name="pHostDatabase"> The host database. If null, the database 
is taken from the first AcDbBlockReference id in the path (even if it is 
in XREF database). </param>
<returns> Acad::ErrorStatus. </returns>

</member>
<member name="M:AcDbCompoundObjectId.setFullPath(AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbDatabase*)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="159">
<summary> Sets this AcDbCompoundObjectId from the path that contains the 
path of AcDbBlockReferences apppended by the leaf AcDbObjectId. 
</summary> 
<param name="fullPath"> The path of AcDbBlockRefrences and the leaf level 
object itself as the last element of the array.
</param>
<param name="pHostDatabase"> The host database. If null, the database 
is taken from the first AcDbBlockReference id in the fullPath. </param>
<returns> Acad::ErrorStatus. </returns>

</member>
<member name="M:AcDbCompoundObjectId.isEmpty" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="171">
<summary> Checks if the AcDbCompoundObjectId contains no data. </summary>

</member>
<member name="M:AcDbCompoundObjectId.isValid(System.Int32)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="175">
<summary> Returns true iff the AcDbCompoundObjectId is valid. The given
validityCheckingLevel specifies the level of testing. Bigger number means
more thorough checks are being performed. At this moment the 
validityCheckingLevel argument is unused but will be used in the future.
</summary>

</member>
<member name="M:AcDbCompoundObjectId.isExternal" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="183">
<summary> Returns true iff the AcDbCompoundObjectId is from an external 
drawing. </summary>

</member>
<member name="M:AcDbCompoundObjectId.isSimpleObjectId" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="188">
<summary> Returns true iff there is no path, only the leaf id (which may be null). 
</summary>

</member>
<member name="M:AcDbCompoundObjectId.getTransform(AcGeMatrix3d*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="205">
<summary> 
Returns the compound transform from the leaf object to the world,
concatennating all the AcDbBlockReference transforms, from the most nested
one to the topmost one. This transformation represents mapping of the
coordinates of the leaf-level object from its AcDbBlockTableRecord 
coordinate space to the world coordinate space.
</summary>
<param name="trans"> The returned compound transform. </param>
<returns> Acad::ErrorStatus. </returns>

</member>
<member name="M:AcDbCompoundObjectId.remap(AcDbIdMapping!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="217">
<summary> Remaps all the AcDbObjectIds in this AcDbCompoundObjectId by 
the given AcDbIdMapping. Returns true if any remapping actually happened, 
false otherwise. </summary>
<param name="idMap"> See the description of the AcDbIdMapping class. </param>
<returns> True if some ids actually changed, false otherwise. </returns>

</member>
<member name="M:AcDbCompoundObjectId.dwgInFields(AcDbDwgFiler*,System.Int32)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="227">
<remarks>
The ownerVersion greater or equal to 0 means the new format, less than 0
means the old format (w/o the class name and object version) that we need 
to maintain only to be able to read Beta1/2 drawings.
</remarks>

</member>
<member name="M:AcDbCompoundObjectId.dxfInFields(AcDbDxfFiler*,AcDbDatabase*,System.Int32)" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="237">
<remarks>
The ownerVersion greater or equal to 0 means the new format, less than 0
means the old format (w/o the class name and object version) that we need 
to maintain only to be able to read Beta1/2 drawings.
</remarks>

</member>
<member name="M:AcDbCompoundObjectId.nullId" decl="true" source="c:\objectarx\inc\acdbcompoundobjectid.h" line="245">
<summary> Returns an empty AcDbCompoundObjectId. </summary> 

</member>
<member name="T:AcDbGeomRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="23">
<summary><para>
Base class for the concrete derived classes like AcDbFaceRef, AcDbEdgeRef, 
AcDbVertexRef, and AcDbPathRef. These are simple classes that keep a reference 
to a subentity of an entity and can represent this subentity information in 
various ways. They are used mainly to pass around information about geometry 
of a subentity or of an entity, not to keep this information.
</para><para>
The subentity references are non-presistent. Anytime the referenced entity 
is changed or re-evaluated, the subentity reference becomes invalid.
Persistent references can be established using AcDbAssocEdgeActionParam, 
AcDbAssocPathActionParam, AcDbAssocVertexActionParam, or directly using 
AcDbAssocGeomDependencies.
</para></summary>

</member>
<member name="M:AcDbGeomRef.reset" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="44">
<summary> Resets the contents of the AcDbGeomRef to empty. </summary>

</member>
<member name="M:AcDbGeomRef.isValid" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="48">
<summary> Checks is the contents of this AcDbGeomRef is valid. </summary>

</member>
<member name="M:AcDbGeomRef.isEmpty" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="52">
<summary> 
Checks if the AcDbGeomRef is empty, i.e. not referencing any entity,
subentity, and not holding any constant geometry. 
</summary>

</member>
<member name="M:AcDbGeomRef.createEntity" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="59">
<summary> 
Creates a new non-database resident AcDbEntity from the data the AcDbGeomRef
holds, and returns it to the caller. The caller is responsible for deleting 
the entity after it is no more needed. 
</summary>

</member>
<member name="M:AcDbGeomRef.evaluateAndCacheGeometry" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="67">
<summary> 
If the AcDbGeomRef references some entities and also caches the constant
geometry, this method evaluates the current geometry from the referenced
entities and caches it in the constant geometry.
</summary>

</member>
<member name="T:AcDbSubentRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="77">
<summary><para>
Base class for AcDbFaceRef, AcDbEdgeRef and AcDbVertexRef. It keeps an 
AcDbCompoundObjectId of an AcDbEntity and AcDbSubentId of a subentity of 
this entity.
</para></summary>

</member>
<member name="M:AcDbSubentRef.#ctor" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="88">
<summary> Default constructor. </summary>

</member>
<member name="M:AcDbSubentRef.#ctor(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="92">
<summary> The constructor sets data members of the AcDbSubentRef. </summary>

</member>
<member name="M:AcDbSubentRef.entity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="103">
<summary> 
Returns the AcDbCompoundObjectId of the entity that the AcDbSubentRef references.
May be empty if a derived class holds constant geometry and does not 
reference any existing AcDbEntity.
</summary>

</member>
<member name="M:AcDbSubentRef.subentId" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="111">
<summary> 
Returns the AcDbSubentId in an AcDbEntity that the AcDbSubentRef references. 
May be null if whole AcDbEntity is referenced.
</summary>

</member>
<member name="M:AcDbSubentRef.createEntity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="118">
<summary> 
Creates an AcDbEntity from the subentity of the entity.
</summary>

</member>
<member name="M:AcDbSubentRef.evaluateAndCacheGeometry" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="124">
<summary>
No cached constant geoemtry held in AcDbSubentRef base class.
</summary>

</member>
<member name="M:AcDbSubentRef.setEntity(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="132">
<summary> Sets mEntity data member. </summary>

</member>
<member name="M:AcDbSubentRef.setSubent(AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="136">
<summary> Sets mSubentId data member. </summary>

</member>
<member name="M:AcDbSubentRef.setFromSubentPath(AcDbFullSubentPath!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="140">
<summary> Sets mEntity and mSubentId data members. </summary>

</member>
<member name="T:AcDbFaceRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="150">
<summary>
Reference to a face. It can either be represented by a face AcDbSubentId of 
an ASM-based AcDbEntity (AcDbSurface, AcDb3dSolid, AcDbRegion) or by
a constant ASM BODY and the AcDbSubentId then specifies the index of the 
face in the constant ASM BODY.
</summary>

</member>
<member name="M:AcDbFaceRef.#ctor" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="166">
<summary> Default constructor. </summary>

</member>
<member name="M:AcDbFaceRef.#ctor(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,BODY*)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="172">
<summary> 
The constructor sets the data members of the AcDbFaceRef. The provided
ASM BODY is not copied, the caller is responsible for providing a copy,
if needed.
</summary>

</member>
<member name="T:BODY" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="188">
<summary> 
Returns the ASM BODY that the AcDbFaceRef may hold. It does not return a 
copy of the ASM BODY, therefore the client code needs to make a copy if 
it needs to do any modifications to this ASM BODY.
</summary>

</member>
<member name="M:AcDbFaceRef.createEntity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="196">
<summary> 
Creates a new non-database resident AcDbEntity from the data the AcDbFaceRef
holds, and returns it to the caller. The caller is responsible for deleting 
the entity after it is no more needed. 
</summary>

</member>
<member name="M:AcDbFaceRef.evaluateAndCacheGeometry" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="204">
<summary>
For now this method does nothing.
</summary>

</member>
<member name="T:AcDbEdgeRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="215">
<summary><para>
Reference to an edge, i.e. a subentity whose geometry is a simple curve. 
</para><para>
It may either be the whole entity that itself is a single curve, kEdgeSubentType 
subentity of an entity, or a constant AcGeCurve3d. Notice that this reference
is generally non-persistent, because it uses transient AcDbSubentId. 
</para><para>
The option to reference the whole entity is questionable and has been provided
just for the compatibility with old code that takes the whole entity. We should 
probably always represent edges by kEdgeSubentType subentities of entities, even
if the whole entity is just a single edge, such as line, arc, or circle.
</para></summary>

</member>
<member name="M:AcDbEdgeRef.#ctor" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="236">
<summary> Default constructor. </summary>

</member>
<member name="M:AcDbEdgeRef.#ctor(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeCurve3d!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="242">
<summary> The constructor sets the data members of the AcDbEdgeRef. </summary>

</member>
<member name="M:AcDbEdgeRef.#ctor(AcDbFullSubentPath!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="249">
<summary> 
Creates AcDbEdgeRef from an entity in a block table record
and referenced via a path of block inserts.
</summary>

</member>
<member name="M:AcDbEdgeRef.#ctor(AcDbEntity!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="256">
<summary> 
The constructor makes the AcDbEdgeRef keep the AcDbObjectId of the given 
AcDbEntity. Moreover, if the entity is derived from AcDbCurve, it obtains 
a copy of the AcGeCurve3d and keeps in it the AcDbEdgeRef.
</summary>

</member>
<member name="M:AcDbEdgeRef.#ctor(AcGeCurve3d!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="264">
<summary> 
The constructor makes the AcDbEdgeRef keep the AcGeCurve3d.
</summary>

</member>
<member name="M:AcDbEdgeRef.setFaceSubentity(AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="278">
<summary> 
The AcDbEdgeRef can also hold AcDbSubentId of a face subentity. The face
needs to bounded by the referenced edge subentity. The additional face 
information is needed in cases like when an edge shared by two adjacent 
faces is refrenced and used for a smooth blend operation. It needs to
be known which face to use to create the smooth blend to.
</summary>

</member>
<member name="M:AcDbEdgeRef.faceSubentId" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="288">
<summary> 
Returns the optional face AcDbSubentId of one of the faces adjacent to the
referenced edge.
</summary>

</member>
<member name="M:AcDbEdgeRef.curve" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="295">
<summary> 
Returns the constant AcGeCurve3d* that the AcDbEdgeRef may hold.
</summary>

</member>
<member name="M:AcDbEdgeRef.evaluateCurve(AcGeCurve3d**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="301">
<summary> 
Evaluates the curve from the referenced entity geometry. If no entity 
is referenced, returns the cached curve. The caller is responsible for
deleting the returned AcGeCurve3d*
</summary>

</member>
<member name="M:AcDbEdgeRef.createEntity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="309">
<summary> 
Creates a new non-database resident AcDbEntity from then data the AcDbEdgeRef
holds, and returns it to the caller. The caller is responsible for deleting 
the entity after it is no more needed. 
</summary>

</member>
<member name="M:AcDbEdgeRef.evaluateAndCacheGeometry" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="317">
<summary> 
Calls evaluateCurve() and replaces the current constant AcGeCurve3d* with the
newly evaluated curve.
</summary>

</member>
<member name="T:AcDbVertexRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="343">
<summary>
Reference to a vertex, i.e. a subentity whose geometry is a point. It may 
either be whole AcDbPoint entity, kVertexSubentType subentity of an entity, or 
a constant AcGePoint3d. Notice that this reference is generally non-persistent, 
because it uses transient AcDbSubentId. 
</summary>

</member>
<member name="T:AcDbVertexRef.ImpliedType" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="359">
<summary><para>
An implied vertex ref is a special point on another AcDbGeomRef.
</para><para>
Currently we only have implied vertex ref types for the most common case of 
special points on an AcDbEdgeRef. I am not sure if we should keep extending this 
mechanism in the future. Other mechanisms, such as derivation from AcDbVertexRef, 
should be used for more specialized and/or less common cases. 
</para></summary>

</member>
<member name="M:AcDbVertexRef.#ctor" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="380">
<summary> Default constructor. </summary>

</member>
<member name="M:AcDbVertexRef.#ctor(AcDbCompoundObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="386">
<summary> The constructor sets the data members of the AcDbEdgeRef. </summary>

</member>
<member name="M:AcDbVertexRef.#ctor(AcDbFullSubentPath!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="390">
<summary> 
Creates AcDbVertexRef from an entity in a block table record
and referenced via a path of block inserts.
</summary>

</member>
<member name="M:AcDbVertexRef.#ctor(AcDbEntity!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="397">
<summary> 
The constructor makes the AcDbVertexRef keep the AcDbObjectId of the given 
AcDbEntity. Moreover, if the entity is derived from AcDbPoint, it keeps 
its AcGePoint3d as AcGePoint3d.
</summary>

</member>
<member name="M:AcDbVertexRef.#ctor(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="405">
<summary> 
The constructor makes the AcDbVertexRef keep the AcGePoint3d.
</summary>

</member>
<member name="M:AcDbVertexRef.#ctor(AcDbVertexRef.ImpliedType,AcDbEdgeRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="411">
<summary>
Constructor for creating implied vertex refs, i.e. a vertex being defined 
as being a special point on an AcDbEdgeRef. See more comments at the 
ImpliedType enum.
</summary>

</member>
<member name="M:AcDbVertexRef.entity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="426">
<summary> 
If referencedRef() is not NULL, returns its AcDbCompoundObjectId, otherwise 
returns AcDbCompoundObjectId from the base-class AcDbSubentRef.
</summary>

</member>
<member name="M:AcDbVertexRef.subentId" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="433">
<summary> 
If referencedRef() is not NULL, returns kNussSubentId, otherwise returns 
AcDbSubentId from the base-class AcDbSubentRef.

TODO Jiri kripac:
The semantics of this method is questionable and should be revisited
because an implied vertex does identify a subentity, but there is no 
simple AcDbSubentId for it.
</summary>

</member>
<member name="M:AcDbVertexRef.impliedType" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="445">
<summary> 
The following are for implied vertex refs (see more comments comments 
at ImpliedType enum). The returned referenced AcDbGeomRef is currently 
always an AcDbEdgeRef but we want to keep the protocol general.
</summary>

</member>
<member name="M:AcDbVertexRef.point" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="455">
<summary> 
Returns the AcGePoint3d directly held in the AcDbVertexRef. 
</summary>

</member>
<member name="M:AcDbVertexRef.evaluatePoint(AcGePoint3d*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="461">
<summary> 
Evaluates the point from the referenced geometry. If no geometry, 
returns the cached point coordinates.
</summary>

</member>
<member name="T:AcDbEntity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="468">
<summary> 
Creates a new non-database resident AcDbPoint from then data the AcDbVertexRef
holds, and returns it to the caller. The caller is responsible for deleting 
the AcDbPoint after it is no more needed. 
</summary>

</member>
<member name="M:AcDbVertexRef.evaluateAndCacheGeometry" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="476">
<summary> 
Calls evaluatePoint() and replaces the current constant AcGePoint3d with the
newly evaluated point.
</summary>

</member>
<member name="T:AcDbPathRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="501">
<summary>
Reference to a path, which is just a sequence of edges. If the path has an 
array of edges which happen to be connected at their end points, it will try 
to concatenate the curves into one composite curve.
</summary>

</member>
<member name="M:AcDbPathRef.#ctor" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="512">
<summary> Default constructor. </summary>

</member>
<member name="M:AcDbPathRef.#ctor(AcArray&lt;AcDbEdgeRef&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="517">
<summary> 
Creates an AcDbPathRef from a sequence of AcDbEdgeRefs.
</summary>

</member>
<member name="M:AcDbPathRef.#ctor(AcArray&lt;AcDbFullSubentPath,AcArrayObjectCopyReallocator&lt;AcDbFullSubentPath&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbFullSubentPath,AcArrayObjectCopyReallocator&lt;AcDbFullSubentPath&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="523">
<summary> 
Constructor an AcDbPathRef that is a sequence of connected edges.
</summary>
<param name="edgeSubentPathArr"> 
Subent paths of the edges that make up the path. 
</param>
<param name="faceSubentPathArr"> 
Optional subent paths of the faces for each edge.  The number of elements in
this array must be 0 or be the same as the number of elements in
edgeSubentPathArr. 
</param>
</member>
<member name="M:AcDbPathRef.setEdgeRefs(AcArray&lt;AcDbEdgeRef&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="545">
<summary> Sets the AcDbPathRef from a sequence of AcDbEdgeRefs. </summary>

</member>
<member name="M:AcDbPathRef.getEntityArray(AcArray&lt;AcDbEntity**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="549">
<summary> 
Returns an array of AcDbEntities created from the individual AcDbEdgeRefs
in the path. If concatenate is true, it tries to concatenate them.
</summary>

</member>
<member name="M:AcDbPathRef.edgeRefs" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="556">
<summary> Returns the array of AcDbEdgeRefs kept in the AcDbPathRef. </summary>

</member>
<member name="M:AcDbPathRef.isEqualTo(AcGeCurve3d!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="560">
<summary> Returns true if the geometry of the path is equal to the geometry of the given curve. </summary>

</member>
<member name="M:AcDbPathRef.isReferencePath" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="564">
<summary> 
Returns true if all elements of the path are references to entities, i.e.
they are not constant geometries.
</summary>

</member>
<member name="M:AcDbPathRef.evaluateAndCacheGeometry" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="573">
<summary> 
Calls evaluateAndCacheGeometry() on all the owned AcDbEdgeRefs.
</summary>

</member>
<member name="T:AcDbVectorRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="584">
<summary>
Arbitrary 3D vector, of any length.
</summary>
<remarks> For internal use only. </remarks>

</member>
<member name="M:AcDbVectorRef.createEntity" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="618">
<summary> 
TBD
</summary>

</member>
<member name="M:AcDbVectorRef.evaluateAndCacheGeometry" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="624">
<summary> 
TBD
</summary>

</member>
<member name="T:AcDbCoordSystemRef" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="636">
<summary>
Coordinate system, actually an arbitrary matrix. The axes do not need to be
unit lengths, perpendicular, or form right-hand coord system (may be mirrored).
</summary>
<remarks> For internal use only. </remarks>

</member>
<member name="M:AcDbCoordSystemRef.createEntity" decl="false" source="c:\objectarx\inc\acdbgeomref.h" line="678">
<summary> 
There is no AcDbEntity created from AcDbCoordSystemRef. 
</summary>

</member>
<member name="M:AcDbCoordSystemRef.evaluateAndCacheGeometry" decl="true" source="c:\objectarx\inc\acdbgeomref.h" line="684">
<summary> 
Calls evaluateAndCacheGeometry on all owned AcDbSubentRefs and then updates
the cached coordinate system.
</summary>

</member>
<member name="T:AcDbSurface.WireframeType" decl="false" source="c:\objectarx\inc\dbsurf.h" line="43">
<summary> 
Control the internal wireframe quilt display when the "edge mode" is 
set to Isolines in any of the Visual Styles.
</summary>

</member>
<member name="F:kIsolines" decl="false" source="c:\objectarx\inc\dbsurf.h" line="49">
<summary> 
The quilt representation is controlled by the SURFV and SURFU
at creation time for surfaces.
</summary>

</member>
<member name="F:kIsoparms" decl="false" source="c:\objectarx\inc\dbsurf.h" line="56">
<summary> 
The quilt representation is based on the projection of
the knot structure of surface.
</summary>

</member>
<member name="T:AcDbSurface.EdgeExtensionType" decl="false" source="c:\objectarx\inc\dbsurf.h" line="64">
<summary>
Defines possible edge extension types as input for extendEdges or 
createExtendSurface methods.
</summary>

</member>
<member name="F:kExtendEdge" decl="false" source="c:\objectarx\inc\dbsurf.h" line="70">
<summary> Edges will be extended. </summary>
</member>
<member name="F:kStretchEdge" decl="false" source="c:\objectarx\inc\dbsurf.h" line="72">
<summary> Edges will be stretched. </summary>
</member>
<member name="M:AcDbSurface.createExtrudedSurface(AcDb3dProfile*,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSweepOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbExtrudedSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="85">
<summary> 
Creates an extruded surface from the given profile using the specified options
and adds the surface to the current database.
</summary>
<param name="pSweep"> 
Input profile to be extruded.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges.
</param>
<param name="directionVec"> 
Input direction of extrusion.  This vector must not be zero-length. 
</param>
<param name="sweepOptions"> 
Input sweep options. 
</param>
<param name="newExtrudedSurface"> 
Pointer to the extruded surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createExtrudedSurface(AcDb3dProfile*,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSweepOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="111">
<summary> 
Creates an extruded surface from the given profile using the specified options
and adds the surface to the current database.
</summary>
<param name="pSweep"> 
Input profile to be extruded.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges.
</param>
<param name="directionVec"> 
Input direction of extrusion.  This vector must not be zero-length. 
</param>
<param name="sweepOptions"> 
Input sweep options. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether extruded surface associativity is enabled. 
</param>
<param name="newExtrudedSurfaceId"> 
ObjectId to the extruded surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createRevolvedSurface(AcDb3dProfile*,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,System.Double,AcDbRevolveOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbRevolvedSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="141">
<summary> 
Creates a revolved surface from the given profile using the specified options.
</summary>
<param name="pRev"> 
Input profile to be revolved.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges. 
</param>
<param name="axisPnt"> 
Any point on the axis of revolution. 
</param>
<param name="axisDir"> 
Direction vector of the axis of revolution.  This vector must not be zero-length.  
</param>
<param name="revAngle"> 
Angle through which the profile is to be revolved.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="startAngle"> 
Starting angle of the profile.  If this parameter is 0.0 then the profile will
be revolved from its current position.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="revolveOptions"> 
Input revolve options. 
</param>
<param name="newRevolvedSurface"> 
Pointer to new revolved surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createRevolvedSurface(AcDb3dProfile*,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,System.Double,AcDbRevolveOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="181">
<summary> 
Creates a revolved surface from the given profile using the specified options.
</summary>
<param name="pRev"> 
Input profile to be revolved.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges. 
</param>
<param name="axisPnt"> 
Any point on the axis of revolution. 
</param>
<param name="axisDir"> 
Direction vector of the axis of revolution.  This vector must not be zero-length.  
</param>
<param name="revAngle"> 
Angle through which the profile is to be revolved.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="startAngle"> 
Starting angle of the profile.  If this parameter is 0.0 then the profile will
be revolved from its current position.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="revolveOptions"> 
Input revolve options. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether revolved surface associativity is enabled. 
</param>
<param name="newRevolvedSurface"> 
Pointer to new revolved surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createRevolvedSurface(AcDb3dProfile*,AcDb3dProfile*,System.Boolean,System.Double,System.Double,AcDbRevolveOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbRevolvedSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="224">
<summary> 
Creates a revolved surface from the given profile using the specified options.
</summary>
<param name="pRev"> 
Input profile to be revolved.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges. 
</param>
<param name="pAxis"> 
Profile which is either a line or a linear edge of a surface or solid.
</param>
<param name="flipAxisDirection"> 
True if the direction of the axis should be taken in the opposite direction of
the entity defined by pAxis.
</param>
<param name="revAngle"> 
Angle through which the profile is to be revolved.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="startAngle"> 
Starting angle of the profile.  If this parameter is 0.0 then the profile will
be revolved from its current position.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="flipAxisDirection"> 
This parameter is only relevant when pAxisEnt is non-null.
In this case this parameter specifies 
</param>
<param name="revolveOptions"> 
Input revolve options. 
</param>
<param name="newRevolvedSurface"> 
Pointer to te new revolved surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createRevolvedSurface(AcDb3dProfile*,AcDb3dProfile*,System.Boolean,System.Double,System.Double,AcDbRevolveOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="268">
<summary> 
Creates a revolved surface from the given profile using the specified options.
</summary>
<param name="pRev"> 
Input profile to be revolved.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges. 
</param>
<param name="pAxis"> 
Profile which is either a line or a linear edge of a surface or solid.
</param>
<param name="flipAxisDirection"> 
True if the direction of the axis should be taken in the opposite direction of
the entity defined by pAxis.
</param>
<param name="revAngle"> 
Angle through which the profile is to be revolved.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="startAngle"> 
Starting angle of the profile.  If this parameter is 0.0 then the profile will
be revolved from its current position.  This angle is taken to be
counter-clockwise about the axis of revolution.
</param>
<param name="flipAxisDirection"> 
This parameter is only relevant when pAxisEnt is non-null.
In this case this parameter specifies 
</param>
<param name="revolveOptions"> 
Input revolve options. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether revolved surface associativity is enabled. 
</param>
<param name="newRevolvedSurfaceId"> 
ObjectId to te new revolved surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createSweptSurface(AcDb3dProfile*,AcDb3dProfile*,AcDbSweepOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSweptSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="317">
<summary> 
Creates a swept surface from the given profile using the specified options.
</summary>
<param name="pSweep"> 
Input profile to be swept.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges. 
</param>
<param name="pPath"> 
Input profile along which pSweep is to be swept.  This must be a curve or
an edge.
</param>
<param name="sweepOptions"> 
Input sweep options. 
</param>
<param name="newSweptSurface"> 
Pointer to the new swept surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createSweptSurface(AcDb3dProfile*,AcDb3dProfile*,AcDbSweepOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="343">
<summary> 
Creates a swept surface from the given profile using the specified options.
</summary>
<param name="pSweep"> 
Input profile to be swept.  This may be an entity such as a curve or
planar surface or it may be an edge or set of connected edges. 
</param>
<param name="pPath"> 
Input profile along which pSweep is to be swept.  This must be a curve or
an edge.
</param>
<param name="sweepOptions"> 
Input sweep options. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether swept surface associativity is enabled. 
</param>
<param name="newSurfaceId"> 
Object id of swept surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createLoftedSurface(AcArray&lt;AcDbLoftProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbLoftProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbLoftProfile*,AcDbLoftOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="373">
<summary> 
Creates a lofted surface from the given profiles using the specified options
and adds it to the current database.  The cross sections, guides, and path
may be entities such as curves or points, or they may be edges or sets of
connected edges.  The cross sections must be either all open or all closed.
If the cross sections are all closed, then this function will accept a point
entity as the first and/or last list entry.  Each profile in the guides list
must intersect each of the cross-section profiles, so the guides form a
net-like structure with the cross-sections. Both the cross-section profiles
and the guide profiles will lie on the resulting surface. If any guide profiles
are passed in this list, then pPath should be null. If pPath is non-null, then
the resulting surface will follow the shape of this profile as much as possible.
This profile does not need to intersect the cross-section profiles and does not
even need to be near the cross sections.
</summary>
<param name="crossSections"> 
Input array of profiles to be used as cross sections for the lofting operation. 
</param>
<param name="guides"> 
Input optional array of guide profiles. 
</param>
<param name="pPath"> 
Input optional path profile. 
</param>
<param name="loftOptions"> 
Input loft options. 
</param>
<param name="newSurface"> 
Pointer to the new lofted surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createLoftedSurface(AcArray&lt;AcDbLoftProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbLoftProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbLoftProfile*,AcDbLoftOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="412">
<summary> 
Creates a lofted surface from the given profiles using the specified options
and adds it to the current database.  The cross sections, guides, and path
may be entities such as curves or points, or they may be edges or sets of
connected edges.  The cross sections must be either all open or all closed.
If the cross sections are all closed, then this function will accept a point
entity as the first and/or last list entry.  Each profile in the guides list
must intersect each of the cross-section profiles, so the guides form a
net-like structure with the cross-sections. Both the cross-section profiles
and the guide profiles will lie on the resulting surface. If any guide profiles
are passed in this list, then pPath should be null. If pPath is non-null, then
the resulting surface will follow the shape of this profile as much as possible.
This profile does not need to intersect the cross-section profiles and does not
even need to be near the cross sections.
</summary>
<param name="crossSections"> 
Input array of profiles to be used as cross sections for the lofting operation. 
</param>
<param name="guides"> 
Input optional array of guide profiles. 
</param>
<param name="pPath"> 
Input optional path profile. 
</param>
<param name="loftOptions"> 
Input loft options. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether lofted surface associativity is enabled. 
</param>
<param name="newSurfaceId"> 
Object id of lofted surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createNetworkSurface(AcArray&lt;AcDb3dProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDb3dProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="454">
<summary> 
Creates a network surface and adds it to the current database.
A network surface is similar to a lofted surface where the u profiles are
cross sections and the v profiles are guides.  But unlike the lofted surface,
the v profiles do not need to intersect the u profiles.  If the two sets of 
profiles do not all intersect then in general the profiles will not lie on
the resulting surface.
</summary>
<param name="crossSections"> 
Input array of u-direction profiles. 
</param>
<param name="guides"> 
Input array of v-direction profiles. 
</param>
<param name="newSurface"> 
Pointer to the new network surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createNetworkSurface(AcArray&lt;AcDb3dProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDb3dProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="479">
<summary> 
Creates a network surface and adds it to the current database.
A network surface is similar to a lofted surface where the u profiles are
cross sections and the v profiles are guides.  But unlike the lofted surface,
the v profiles do not need to intersect the u profiles.  If the two sets of 
profiles do not all intersect then in general the profiles will not lie on
the resulting surface.
</summary>
<param name="crossSections"> 
Input array of u-direction profiles. 
</param>
<param name="guides"> 
Input array of v-direction profiles. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether network surface associativity is enabled. 
</param>
<param name="newSurfaceId"> 
Object id of network surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createPatchSurface(AcDbPathRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32,System.Double,AcDbSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="508">
<summary> 
Create patch surface by specifying one of the following:
  + edges which must form a closed loop. 
  + profile curves which must form a closed loop
The API doesn't support mixing the two yet.

The constraintIds are optional which specify the objectID of curve or point 
to be passed by the patch surface as constraint. 
Continuity and bulge only apply to boundary edges, not the constraint curves.

</summary>
<param name="pathRef"> 
Input edge reference which can be edges of entities or proflie curves 
</param>
<param name="constraintIds"> 
Optional contrainted curve or point. 
</param>
<param name="continuity"> 
Optional continuity for patch created with edges 
</param>
<param name="bulge"> 
Optional bulge for patch created with edges
</param>
<param name="newSurface"> 
Pointer to the new patch surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createPatchSurface(AcDbPathRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32,System.Double,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="545">
<summary> 
Create an associative patch surface by specifying one of the following:
  + edges which must form a closed loop. 
  + profile curves which must form a closed loop
The API doesn't support mixing the two yet.

The constraintIds are optional which specify the objectID of curve or point 
to be passed by the patch surface as constraint. 
Continuity and bulge only apply to boundary edges, not the constraint curves.

</summary>
<param name="pathRef"> 
Input edge reference which can be edges of entities or proflie curves 
</param>
<param name="constraintIds"> 
Optional contrainted curve or point. 
</param>
<param name="continuity"> 
Optional continuity for patch created with edges 
</param>
<param name="bulge"> 
Optional bulge for patch created with edges
</param>
<param name="bAssociativeEnabled"> 
Specifies whether patch surface associativity is enabled. 
</param>
<param name="newSurfaceId"> 
Object id of patch surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createBlendSurface(AcDbLoftProfile*,AcDbLoftProfile*,AcDbBlendOptions*,AcDbSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="585">
<summary> 
 Creates a blend surface from the given profiles using the specified options
 and adds it to the current database. The startProfile and endProfile must
 be edges or a set of connected edges. 
</summary>
<param name="startProfile"> 
Input profile to be used as the start for blend operation. 
</param>
<param name="endProfile"> 
Input profile to be used as the end for blend operation. 
</param>
<param name="blendOptions"> 
Input blend options.
</param>
<param name="blendSurface"> 
Pointer to the blend surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createBlendSurface(AcDbLoftProfile*,AcDbLoftProfile*,AcDbBlendOptions*,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="612">
<summary> 
 Creates a blend surface from the given profiles using the specified options
 and adds it to the current database. The startProfile and endProfile must
 be edges or a set of connected edges. 
</summary>
<param name="startProfile"> 
Input profile to be used as the start for blend operation. 
</param>
<param name="endProfile"> 
Input profile to be used as the end for blend operation. 
</param>
<param name="blendOptions"> 
Input blend options.
</param>
<param name="bAssociativeEnabled"> 
Specifies whether blend surface associativity is enabled. 
</param>
<param name="newSurfaceId"> 
Object id of blend surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createFilletSurface(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,AcDb.FilletTrimMode,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSurface**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="642">
<summary> 
 Creates a tangent surface between two surface edges with constant radius
 and trim or no trim the original surfaces to it.
</summary>
<param name="surfId1"> 
Input objectID of the first source surface.
</param>
<param name="pickPt1"> 
Input 3D point specifying the side on the first source surface you want to  
keep after filleting.
</param>
<param name="surfId2"> 
Input objectID of the second source surface.
</param>
<param name="pickPt2"> 
Input 3D point specifying the side on the second source surface you want to 
keep after filleting.
</param>
<param name="radius"> 
Input positive value specifying radius for fillet operation.
</param>
<param name="trimMode"> 
Input flag specifying enum value of kTrimNone, kTrimFirst, kTrimSecond or 
kTrimBoth. 
</param>
<param name="projDir"> 
Input 3D vector specifying the projection (view) direction for pick points.
This vector is used for calculation of the projection point on the source
surfaces for pickPt1 and pickPt2. 
</param>
<param name="filletSurface"> 
Pointer to the fillet surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createFilletSurface(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,AcDb.FilletTrimMode,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="688">
<summary> 
 Creates a tangent surface between two surface edges with constant radius
 and trim or no trim the original surfaces to it.
</summary>
<param name="surfId1"> 
Input objectID of the first source surface.
</param>
<param name="pickPt1"> 
Input 3D point specifying the side on the first source surface you want to  
keep after filleting.
</param>
<param name="surfId2"> 
Input objectID of the second source surface.
</param>
<param name="pickPt2"> 
Input 3D point specifying the side on the second source surface you want to 
keep after filleting.
</param>
<param name="radius"> 
Input positive value specifying radius for fillet operation.
</param>
<param name="trimMode"> 
Input flag specifying enum value of kTrimNone, kTrimFirst, kTrimSecond or 
kTrimBoth. 
</param>
<param name="projDir"> 
Input 3D vector specifying the projection (view) direction for pick points.
This vector is used for calculation of the projection point on the source
surfaces for pickPt1 and pickPt2. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether filltet surface associativity is enabled. 
</param>
<param name="newSurfaceId"> 
Object id of fillet surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createOffsetSurface(AcDbEntity*,System.Double,AcDbEntity**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="738">
<summary> 
Creates an offset surface.
</summary>
<param name="pInputSurface"> 
Original input surface to be offset. 
</param>
<param name="offsetDistance"> 
Input distance to offset the input surface. 
</param>
<param name="offsetSurface"> 
Pointer to the new offset surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createOffsetSurface(AcDbEntity*,System.Double,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="759">
<summary> 
Creates an offset surface and adds it to the current database.
</summary>
<param name="pInputSurface"> 
Original input surface to be offset. 
</param>
<param name="offsetDistance"> 
Input distance to offset the input surface. 
</param>
<param name="bAssociativeEnabled"> 
Specifies whether patch surface associativity is enabled. 
</param>
<param name="offsetSurfaceId"> 
Object id of offset surface if created successfully. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.createExtendSurface(AcDbObjectId,AcArray&lt;AcDbSubentId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,AcDbSurface.EdgeExtensionType,System.Boolean,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="783">
<summary> 
Creates an extend surface from the given set of edges from a surface
and adds the surface to the current database. All input edges 
should be connected and coming from same surface.
</summary>
<param name="sourceSurface">
Surface id from which edges needs to be extended to create extend surface.
</param>
<param name="edges"> 
Input full sub-entity paths of the edges, that needs to be extended.
</param>
<param name="extDist"> 
Input distance by which surface needs to be extended.
</param>
<param name="extOption"> 
Extension option, if edges needs to be extended or stretched.
</param>
<param name="bAssociativeEnabled"> 
Specifies whether extend surface associativity is enabled. 
</param>
<param name="newExtendSurfaceId"> 
ObjectId to the extend surface if created successfully. 
</param>
<returns>
Acad::eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.trimSurface(AcDbObjectId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcGeVector3d&gt;!System.Runtime.CompilerServices.IsConst,AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,System.Boolean)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="818">
<summary> 
Trims a surface with given cutting surfaces/curves. A surface can be trimmed by other surfaces
or curves. When curves are used, the actual trimming boundary is formed by projecting the curves
onto the surface, so the additional information of project direction needs to be provided.
</summary>
<param name="blankSurfaceId"> 
Original input surface to be trimmed. 
</param>
<param name="toolIds"> 
array of ids of cutting entities that their bodies will be directly used to trim the 
surface without further treatment such as projection. 
</param>
<param name="toolCurveIds"> 
array of ids of cutting curves that will be used to trim the surface by first 
projecting them to the surface 
</param>
<param name="projVectors"> 
array of projection direction of each cutting curve in toolCurveIds, so the length of projVectors
should be equal to the length of toolCurveIds
</param>
<param name="pickPoint"> 
pick point that is used to specify which area of a surface should be trimmed. 
</param>
<param name="viewVector"> 
when using pick point to find out which area to trim, caller should also specify the view direction
which will be used form a ray starting from the pick point in the view direction and see which area
is hit by the ray first. 
</param>
<param name="bAutoExtend"> 
If this option is set then when a tool body consists of a single face with analytic geometry, 
the underlying geometry will be extended as much as possible to make sure the surface is trimmed. 
The tool body supplied will not be modified.
</param>
<param name="bAssociativeEnabled"> 
Specifies whether the surface trimming operation should be associative. 
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.chamferEdges(AcArray&lt;AcDbSubentId**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbSubentId!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,System.Double,System.Boolean)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="907">
<summary> 
This method creates associative chamfers at the specified edges of the 
surface based on input bAssociativeEnabled.
</summary>
<param name="edgeSubentIds"> 
Input object ids of edges at which the chamfer will be applied.
</param>
<param name="baseFaceSubentId"> 
Input object id of the base face where the chamfer will be applied.
</param>
<param name="baseDist"> 
Input chamfer distance on the base face.
</param>
<param name="otherDist"> 
Input chamfer distance on the other faces. 
</param>
<param name="bAssociativeEnabled"> 
A flag to indicate whether chamfer needs to be associative.
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.filletEdges(AcArray&lt;AcDbSubentId**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,System.Boolean)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="935">
<summary> 
This method creates associative fillets at the specified edges of the 
surface based on input bAssociativeEnabled.
</summary>
<param name="edgeSubentIds"> 
Input object ids of the edges where the fillet will be applied.
</param>
<param name="radius"> 
Input fillet radius. 
</param>
<param name="bAssociativeEnabled"> 
A flag to indicate whether chamfer needs to be associative.
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.getWireframeType" decl="true" source="c:\objectarx\inc\dbsurf.h" line="995">
<summary> 
Get WireframeType.
</summary>
<returns>
WireframeType.
</returns>

</member>
<member name="M:AcDbSurface.setWireframeType(AcDbSurface.WireframeType)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1004">
<summary> 
Set WireframeType.
</summary>
<param name="type"> 
WireframeType to set.
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.getPerimeter(System.Double*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1016">
<summary> 
Return the perimeter of surface.
</summary>
<param name="perimeter"> 
Perimeter of surface.
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.creationActionBodyId" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1031">
<summary> 
Get creation action body ID.
</summary>
<returns>
Creation action body id.
</returns>

</member>
<member name="M:AcDbSurface.modificationActionBodyIds(AcArray&lt;AcDbObjectId&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1040">
<summary>
Get moddification action body IDs. 
</summary>
<param name="modificationActionBodyIds"> 
An array to store the returned action body IDs.
</param>
<returns>
eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.extendEdges(AcArray&lt;AcDbFullSubentPath,AcArrayObjectCopyReallocator&lt;AcDbFullSubentPath&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,AcDbSurface.EdgeExtensionType,System.Boolean)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1052">
<summary>
Extends the edges of this surface by mergeing the extended/stretched
edges to existing surface.
</summary>
<param name="edges"> 
Input full sub-entity paths of the edges, that needs to be extended.
</param>
<param name="extDist"> 
Input distance by which surface needs to be extended.
</param>
<param name="extOption"> 
Extension option, if edges needs to be extended or stretched.
</param>
<param name="bAssociativeEnabled"> 
Specifies whether extend surface associativity is enabled. 
</param>
<returns>
Acad::eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.rayTest(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double,AcArray&lt;AcDbSubentId&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;System.Double&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1075">
<summary>
Ray test with the surface. This function will create a ray starting
from rayBasePoint with ray direction defined by rayDir. The rayRadius
defines the tolerance during the intersection check. The returned
subentities could be faces/edges/vertices.
</summary>
<param name="rayBasePoint"> 
Input base point of the ray.
</param>
<param name="rayDir"> 
Input ray direction.
</param>
<param name="rayRadius"> 
input tolerance during the intersection check.
</param>
<param name="subEntIds"> 
Returned array including faces, edges and vertices.
</param>
<param name="parameters"> 
Returned array of doubles indicating the intersection
parameter on the ray with the returned subentities.
The smaller of the parameter, the closer to the base point.
</param>
<returns>
Return Acad::eOk if successful.
</returns>

</member>
<member name="M:AcDbSurface.convertToNurbSurface(AcArray&lt;AcDbNurbSurface**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsurf.h" line="1106">
<summary>
Convert to nurb surfaces. The caller should free the returned nurb surface.
</summary>
<param name="nsArray"> 
The generated Nurb Surface array
</param>
<returns>
Return Acad::eOk if successful.
</returns>

</member>
<!-- 丢弃成员“M:AcDbSurface.projectOnToSurface(AcDbEntity!System.Runtime.CompilerServices.IsConst*,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray<AcDbEntity**>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)”的格式错误的 XML 文档注释。 -->
<member name="T:AcDb3dProfile" decl="false" source="c:\objectarx\inc\db3dprofile.h" line="30">
<summary> <para>
This class is used to represent a 3d profile that can be used as input to
functions such as createExtrudedSurface(), createRevolvedSurface(), and
createSweptSurface().  An object of this class can represent an entity
such as a curve or a region, or it can represent an edge or a set of edges
that form a connected chain.
</para> </summary>

</member>
<member name="M:AcDb3dProfile.#ctor" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="44">
<summary>
Default constructor.
</summary>
</member>
<member name="M:AcDb3dProfile.#ctor(AcDbEntity*)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="49">
<summary> 
Constructor for a profile that is an entity such as a curve or region.
</summary>
<param name="pEntity"> 
Pointer to an AcDbEntity that is to be used as a profile to create
a surface such as an extrusion or loft. 
</param>
</member>
<member name="M:AcDb3dProfile.#ctor(AcDbFullSubentPath!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="58">
<summary> 
Constructor for a profile that is a face.  The profile will consist of
the outer edges of the face.
</summary>
<param name="faceSubentPath"> 
Subent path of the face. 
</param>
</member>
<member name="M:AcDb3dProfile.#ctor(AcDbPathRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="67">
<summary> 
Constructor for a profile that is a path.
</summary>
<param name="pathRef"> 
reference to the path
</param>
</member>
<member name="M:AcDb3dProfile.#ctor(AcDbVertexRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="75">
<summary> 
Constructor for a profile that is a vertex
</summary>
<param name="vertexRef"> 
reference to the vertex
</param>
</member>
<member name="M:AcDb3dProfile.#ctor(AcDb3dProfile!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="83">
<summary> 
Copy constructor.
</summary>
<param name="src"> 
Source object to be copied. 
</param>
</member>
<member name="M:AcDb3dProfile.Dispose" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="91">
<summary> 
Destructor.
</summary>
</member>
<member name="M:AcDb3dProfile.copyFrom(AcRxObject!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="96">
<summary> 
Copies the contents of input object into this object.
</summary>
<param name="src"> 
Source object to be copied.
</param>
<returns>
eOk if successful.
</returns>
</member>
<member name="M:AcDb3dProfile.entity" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="107">
<summary> 
Returns the profile entity.  If the profile is for an edge or set of
edges then the returned entity will be an AcDbCurve of the edge or edges.
The caller should not delete this pointer or post it to the database.
</summary>
<returns>
Profile entity. The caller should not delete this pointer.
</returns>
</member>
<member name="M:AcDb3dProfile.getPathRef(AcDbPathRef*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="117">
<summary> 
Returns the path reference of the edge if the profile is an edge or
set of edges.  If the profile is not an edge or set of edges, pathRef will be
empty and eInvalidInput will be returned
</summary>
<param name="pathRef"> 
path reference of the edge(s) 
</param>
<returns>
Acad::ErrorStatus
</returns>
</member>
<member name="M:AcDb3dProfile.getVertexRef(AcDbVertexRef*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="130">
<summary> 
Returns the vertex reference of the vertex if the profile is a vertex.
If the profile is not an edge or set of edges, vertexRef will be
empty and eInvalidInput will be returned
</summary>
<param name="vertexRef"> 
vertex reference 
</param>
<returns>
Acad::ErrorStatus
</returns>
</member>
<member name="M:AcDb3dProfile.convertProfile(System.Boolean,System.Boolean,System.Boolean,System.Boolean,AcArray&lt;AcDb3dProfile**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="143">
<summary> 
Converts profile into new profiles that are of a type that can be used for
extrude, revolve, sweep, or loft operations.  The converted profiles are returned in
the output array.  If this profile is of type AcDbTrace, AcDbSolid, or AcDbFace then
the converted profile will be for a region.  If this profile is of type
AcDb3dPolyline and the profile is linear or whose 'Fit' property is quadratic or
cubic then the converted profile will be a line or a spline.
</summary>
<param name="explodeMultiFaceRegions"> 
If this profile is of type AcDbSurface or AcDbRegion and has more than one face,
then we explode to get multiple surface or region profiles that each have only
one face. 
</param>
<param name="convertSurfaceToEdges"> 
If this profile is a face or is of type AcDbSurface, AcDbRegion, AcDbTrace,
AcDbSolid, or AcDbFace then we convert to an edge profile that is defined by
the surface or region edges.
</param>
<param name="nonPlanarOnly"> 
This parameter is only relevant when convertSurfaceToEdges is set to true.
If this parameter is true then only non-planar surfaces will be converted to
edge profiles.  Regions and planar surfaces will not be converted.
</param>
<param name="outerLoopOnly"> 
This parameter is only relevant when convertSurfaceToEdges is set to true.
If this parameter is true then only the outer loop of the surface or region
will be converted to an edge profile.
</param>
<param name="convertedProfileArr"> 
Output list of converted profiles.  The caller is responsible for
deleting the objects in this list.
</param>
<returns>
eOk if successful.  Even when this function returns eOk, it is possible for
the output list to be empty depending on the profile type and the values of
the other parameters.
</returns>
</member>
<member name="M:AcDb3dProfile.set(AcDbPathRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="185">
<summary> 
Set the profile to a path.
</summary>
<param name="pathRef"> 
reference to the path
</param>
<returns>
eOk if successful.
</returns>
</member>
<member name="M:AcDb3dProfile.set(AcDbVertexRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="196">
<summary> 
Set the profile to a vertex.
</summary>
<param name="vertexRef"> 
reference to the vertex
</param>
<returns>
eOk if successful.
</returns>
</member>
<member name="M:AcDb3dProfile.set(AcDbEntity*)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="207">
<summary> 
Set the profile to an entity such as a curve or region.
</summary>
<param name="pEntity"> 
Pointer to an AcDbEntity that is to be used as a profile to create
a surface such as an extrusion or loft. 
</param>
<returns>
eOk if successful.
</returns>
</member>
<member name="M:AcDb3dProfile.isClosed" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="219">
<summary> 
Return whether the profile forms a closed loop.
</summary>
<returns>
True if profile is closed, false otherwise.
</returns>
</member>
<member name="M:AcDb3dProfile.isPlanar" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="227">
<summary> 
Return whether the profile is planar.
</summary>
<returns>
True if profile is planar, false otherwise.
</returns>
</member>
<member name="M:AcDb3dProfile.isSubent" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="235">
<summary> 
Return whether the profile is an edge or face.
</summary>
<returns>
True if profile is an edge or face, false otherwise.
</returns>
</member>
<member name="M:AcDb3dProfile.isFace" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="243">
<summary> 
Return whether the profile is a face.
</summary>
<returns>
True if profile is a face, false otherwise.
</returns>
</member>
<member name="M:AcDb3dProfile.isEdge" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="251">
<summary> 
Return whether the profile is an edge.
</summary>
<returns>
True if profile is an edge, false otherwise.
</returns>
</member>
<member name="M:AcDb3dProfile.isValid" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="259">
<summary> 
Return whether the profile is valid and may be used to
create a surface.
</summary>
<returns>
True if profile is a valid entity, edge, or face.
</returns>
</member>
<member name="M:AcDb3dProfile.mergeProfiles(AcArray&lt;AcDb3dProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean,System.Boolean,AcArray&lt;AcDb3dProfile**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="268">
<summary> 
Merge connected sets of profiles into one or more profiles.
</summary>
<param name="profileArr"> 
Input array of profiles that are to be merged.
</param>
<param name="mergeEdges"> 
If this parameter is false then any edge profiles in the input array will
not be merged and will be copied directly to the ouput array.
</param>
<param name="mergeCurves"> 
If this parameter is false then any curve profiles in the input array will
not be merged and will be copied directly to the ouput array.
</param>
<param name="mergedProfileArr"> 
Output array of merged profiles.  The caller is responsible for deleting all
objects that are returned in this array.
</param>
<returns>
eOk if successful.  
</returns>
</member>
<member name="M:AcDb3dProfile.op_Assign(AcDb3dProfile!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="293">
<summary> 
Assignment operator.
</summary>
<param name="src"> 
Source object to be copied. 
</param>
<returns>
Reference to this object.  
</returns>
</member>
<member name="T:AcDbLoftProfile" decl="false" source="c:\objectarx\inc\db3dprofile.h" line="312">
<summary> <para>
This class is used to represent a profile that can be used as input to
createLoftedSurface().  An object of this class can represent an entity
such as a curve or a region, or it can represent an edge or a set of edges
that form a connected chain.  This class also maintains continuity data
if the profile is for an edge or point and the profile is the first or
last profile of the loft.
</para> </summary>

</member>
<member name="M:AcDbLoftProfile.#ctor" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="327">
<summary>
Default constructor.
</summary>
</member>
<member name="M:AcDbLoftProfile.#ctor(AcDbEntity*)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="332">
<summary> 
Constructor for a profile that is an entity such as a curve or region.
</summary>
<param name="pEntity"> 
Pointer to an AcDbEntity that is to be used as a profile to create
a surface such as an extrusion or loft. 
</param>
</member>
<member name="M:AcDbLoftProfile.#ctor(AcDbPathRef!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="341">
<summary> 
Constructor for a profile that is an edge or a sequence of connected
edges.
</summary>
<param name="pathRef"> 
Subent paths of the edges that make up the profile. 
</param>
</member>
<member name="M:AcDbLoftProfile.#ctor(AcGePoint3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="350">
<summary> 
Constructor for a profile that is a point.
</summary>
<param name="pnt"> 
An AcGePoint3d that is to be used as a profile to create
a surface such as an extrusion or loft. 
</param>
</member>
<member name="M:AcDbLoftProfile.#ctor(AcDbLoftProfile!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="359">
<summary> 
Copy constructor.
</summary>
<param name="src"> 
Source object to be copied. 
</param>
</member>
<member name="M:AcDbLoftProfile.copyFrom(AcRxObject!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="367">
<summary> 
Copies the contents of input object into this object.
</summary>
<param name="src"> 
Source object to be copied.
</param>
<returns>
eOk if successful.
</returns>
</member>
<member name="M:AcDbLoftProfile.continuity" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="378">
<summary> 
Return the continuity for the profile: 0, 1, or 2, which
corresponds to a continuity of G0, G1, or G2.  By default, the
continuity is 1 unless it has been explicitly set to another
value.
</summary>
<returns>
Continuity for the profile: 0, 1, or 2, which
corresponds to a continuity of G0, G1, or G2.
</returns>
</member>
<member name="M:AcDbLoftProfile.setContinuity(System.Int16)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="390">
<summary> 
Set the continuity for the profile.
</summary>
<param name="value"> 
Must be 0, 1, or 2, which corresponds to a continuity of
G0, G1, or G2. 
</param>
</member>
<member name="M:AcDbLoftProfile.magnitude" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="399">
<summary> 
Return the magnitude of the takeoff vector if the continuity is
1 or 2.  By default, this value is 0.5 unless it has been
explicitly set to another value.
</summary>
<returns>
Magnitude of the takeoff vector.
</returns>
</member>
<member name="M:AcDbLoftProfile.setMagnitude(System.Double)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="409">
<summary> 
Set the magnitude of the takeoff vector for the profile if
the continuity is 1 or 2.
</summary>
<param name="value"> 
Magnitude of takeoff vector. 
</param>
</member>
<member name="M:AcDbLoftProfile.op_Assign(AcDbLoftProfile!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="418">
<summary> 
Assignment operator.
</summary>
<param name="src"> 
Source object to be copied. 
</param>
<returns>
Reference to this object.
</returns>
</member>
<member name="M:AcDbLoftProfile.op_Assign(AcDb3dProfile!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\db3dprofile.h" line="429">
<summary> 
Assignment operator.  Copies the entity and edge data from the
input object, but does not change the continuity or magnitude.
</summary>
<param name="src"> 
Source object to be copied. 
</param>
<returns>
Reference to this object.
</returns>
</member>
<member name="M:AcDb3dSolid.createLoftedSolid(AcArray&lt;AcDbLoftProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbLoftProfile**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbLoftProfile*,AcDbLoftOptions*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbsol3d.h" line="96">
<summary> 
Creates a lofted solid from the given profiles using the specified options.
The cross sections, guides, and path curve may be entities such as curves or
points.  Edges are not currently allowed for cross sections of a solid.
Only the first and last cross sections may be a point entity.  All other
cross sections must be a closed curve or a surface or region.
Each profile in the guides list must intersect each of the cross-section profiles,
so the guides form a net-like structure with the cross-sections. Both the
cross-section profiles and the guide profiles will lie on the resulting surface.
If any guide profiles are passed in this list, then pPath should be null.
If pPath is non-null, then the resulting surface will follow the shape of this
profile as much as possible. This profile does not need to intersect the
cross-section profiles and does not even need to be near the cross sections.
If this parameter is non-null, then guides should be an empty list. 
</summary>
<param name="crossSections"> 
Input array of profiles to be used as cross sections for the lofting operation. 
</param>
<param name="guides"> 
Input optional array of guide profiles. 
</param>
<param name="pPath"> 
Input optional path profile. 
</param>
<param name="loftOptions"> 
Input loft options. 
</param>
<returns>
eOk if successful.
</returns>
</member>
<member name="T:AcDbAppEntityGrips" decl="false" source="c:\objectarx\inc\dbappgrip.h" line="42">
<summary>
This class allows applications to provide custom grips for entities provide
custom grips for entities without deriving from the entity class (i.e.
without providing a custom object). 
</summary>

<remarks>
Currently only called when elaborating grips for an AcDbBlockReference.
</remarks>

</member>
<member name="M:AcDbAppEntityGrips.getGripPoints(AcArray&lt;AcDbGripData**,AcArrayMemCopyReallocator&lt;AcDbGripData**&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Double!System.Runtime.CompilerServices.IsConst,System.Int32!System.Runtime.CompilerServices.IsConst,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32!System.Runtime.CompilerServices.IsConst,AcDbEntity*)" decl="false" source="c:\objectarx\inc\dbappgrip.h" line="58">
<summary>
Returns the application-defined grip points for an entity. 
</summary>

<param name="grips">
Array of pointers to dynamically allocated AcDbGripData objects, one
for each grip point in the entity.
</param>
<param name="curViewUnitSize">
The size, in pixels, of one drawing unit in the current viewport.
</param>
<param name="gripSize">
The current grip size, in pixels.
</param>
<param name="curViewDir">
A vector describing the view direction in the current viewport.
</param>
<param name="bitflags">
Bitmap of one or more flags specified by the GetGripPointsFlags
enumeration.
</param>
<param name="pEntity">
Pointer to the AcDbEntity to get grips for.
</param>

<returns>
Acad::eOk if successful.
</returns>

<remarks>
Grips returned by all applications are appended to the entity's own
grips. See also AcDbEntity::getGripPoints().
</remarks>

</member>
<member name="M:AcDbAppEntityGrips.moveGripPointsAt(AcArray&lt;System.Void**&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32!System.Runtime.CompilerServices.IsConst,AcDbEntity*)" decl="false" source="c:\objectarx\inc\dbappgrip.h" line="101">
<summary>
Moves a grip point returned by a previous call to
<c>AcDbAppEntityGrips::getGripPoints()</c>.
</summary>

<param name="gripAppData">
Input array of pointers, one for each grip point to be moved; these are
the appData pointers from the AcDbGripData objects for the grip points
to be moved.
</param>
<param name="offset">
A vector, in WCS coordinates, indicating the direction and magnitude of
the translation to be applied to the grips.
</param>
<param name="bitflags">
Reserved for future use, currently zero.
</param>
<param name="pEntity">
Pointer to the AcDbEntity to move grips on. 
</param>

<returns>
Acad::eOk if successful.
</returns>

<remarks>
See also AcDbEntity::moveGripPointsAt().
</remarks>

</member>
<member name="M:AcDbAppEntityGrips.gripStatus(AcDb.GripStat!System.Runtime.CompilerServices.IsConst,AcDbEntity*)" decl="false" source="c:\objectarx\inc\dbappgrip.h" line="136">
<summary>
Grip status callback function.
</summary>

<param name="status">
The new AcDb::GripStat status.
</param>
<param name="pEntity">
Pointer to the AcDbEntity whose grips the status is for.
</param>

<remarks>
This function is called with a status value of kGripsToBeDeleted when
the grips returned by a prior call to
<c>AcDbAppEntityGrips::getGripPoints()</c> are about to be deleted in
the host  application. This notification allows for any required
resource management tasks such  as the deletion of AppData data
associated with any AcDbGripData structures.
</remarks>

</member>
<member name="T:AcDbBlockInsertionPoints" decl="false" source="c:\objectarx\inc\dbappgrip.h" line="164">
<summary>
This class allows applications to elaborate different insertion points for
blocks. 
</summary>

</member>
<member name="M:AcDbBlockInsertionPoints.getInsertionPoints(AcDbBlockTableRecord!System.Runtime.CompilerServices.IsConst*,AcDbBlockReference!System.Runtime.CompilerServices.IsConst*,AcArray&lt;AcGePoint3d&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcGeVector3d&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\dbappgrip.h" line="175">
<summary>
Returns the application-defined insertion points for a block.
</summary>

<param name="pBlock">
A pointer to the block whose insertion points should be elaborated. 
</param>
<param name="pBlkRef">
A pointer to the block reference whose insertion points should be elaborated.
The application can choose to use pBlkRef instead of pBlock, if the block is
being dragged and insertion points or alignment angles change dynamically.
</param>
<param name="insPts">
An array of AcGePoint3d objects, one for each insertion point. The
returned points should be in the coordinate system of the block. 
</param>
<param name="alignmentDirections">
An array of AcGeVector3d objects, one for each insertion point. The
returned vectors describe the alignment direction for the block
when the insertion point passes over other geometry in the drawing. 
</param>

<returns>
Acad::eOk if successful.
</returns>

<remarks>
Any application-defined insertion points supplement the default
insertion point for a block. Some commands (e.g. INSERT) allow
users to cycle through the insertion points of a block when placing
it in a drawing.
Some commands (e.g. INSERT) use the alignment vector for a grip to
automatically rotate the block as it is being dragged for insertion
when the cursor passes over other entities in the drawing. If the
alignment vector for a block is non-zero, when the block passes
over other geometry in the drawing the block is rotated about the
insertion point to make the alignment direction parallel to the
normal of the entity under the cursor at the point closest to the
cursor on the entity. 
The size of the returned arrays must be the same.
</remarks>
</member>
<member name="M:AcDbLayout.getThumbnail(tagBITMAPINFO**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dblayout.h" line="76">
<summary>
This function provides BITMAP thumbnail of layout as output
</summary>
<param name="thumbnail"> A reference to a pointer of Bitmap thumbnail, containing header and pixels </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>

</member>
<member name="M:AcDbLayout.setThumbnail(tagBITMAPINFO!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dblayout.h" line="84">
<summary>
This function sets BITMAP thumbnail into layout
</summary>
<param name="thumbnail"> A pointer of Bitmap thumbnail to be set into layout </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>

</member>
<member name="M:AcDbLayout.getPreviewImage(Atil.Image**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dblayout.h" line="92">
<summary>
This function provides Atil::Image thumbnail of layout as output
</summary>
<param name="pPreviewImage"> A reference to the pointer of Atil::Image thumbnail </param>
<returns> This will return Acad::eOk if thumbnail is successfully retrieved. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="M:AcDbLayout.setPreviewImage(Atil.Image!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dblayout.h" line="101">
<summary>
This functions sets Atil::Image thumbnail into layout
</summary>
<param name="pPreviewImage"> A pointer of Atil::Image thumbnail to be set into layout </param>
<returns> This will return Acad::eOk if thumbnail is successfully set. It returns error status otherwise </returns>
<remarks> Internal use only </remarks>

</member>
<member name="T:AcGiMaterialMap.Filter" decl="false" source="c:\objectarx\inc\acgimaterial.h" line="416">
<summary>Material map filtering settings.</summary>
</member>
<member name="F:kFilterDefault" decl="false" source="c:\objectarx\inc\acgimaterial.h" line="419">
<summary>
Uses the default filtering setting rather than explicitly setting a
particular filtering type.
</summary>
</member>
<member name="F:kFilterNone" decl="false" source="c:\objectarx\inc\acgimaterial.h" line="425">
<summary>Explicitly disables filtering on this material map.</summary>
</member>
<member name="M:AcGiMaterialMap.setFilter(AcGiMaterialMap.Filter)" decl="true" source="c:\objectarx\inc\acgimaterial.h" line="461">
<summary>
Sets the filtering to use on the material map.  This may not be applicable
to material maps which do not use filtering, such as procedural maps.
</summary>
<param name="filter">New filter setting.</param>
<returns>Acad::eOk if the new filter can be set.</returns>
</member>
<member name="M:AcGiMaterialMap.filter" decl="true" source="c:\objectarx\inc\acgimaterial.h" line="469">
<summary>
<para>
Returns he filtering to use on the material map.  This may not be applicable
to material maps which do not use filtering, such as procedural maps.
</para>
<para>
The default setting is kFilterDefault.
</para>
</summary>
<returns>The current filter set on the material map object.</returns>
</member>
<member name="T:AcDbXrefFileLocker" decl="false" source="c:\objectarx\inc\xreflock.h" line="84">
<summary>
The constructor locks the XREF file, checks consistency, and reloads all releated 
databases than need to be reloaded. The destructor saves changes made to the XREF
database back to the XREF file and releases the lock on the XREF file. If there 
were some objects in the XREF database that are open, it temporarily closes them 
before doing the save back to the XREF file, and reopens them after the save.
</summary>
<remarks> This class is at this time for internal use only. </remarks>

</member>
<member name="M:AcDbXrefFileLocker.#ctor(AcDbDatabase*)" decl="true" source="c:\objectarx\inc\xreflock.h" line="96">
<summary>
Locks the XREF file, checks consistency, and reloads all releated databases than 
need to be reloaded. If the database ix NULL or not an XREF database, it does not
nothing ant treats this condition as an expected condition, so that client code 
does not need to check what database it passes to the constructor. If there are 
any opened objects and the XREF database would need to be reloaded, it returns 
eXrefReloaded ErrorStatus, because it is not possible to reload a database when 
it has some opened objects in it. </summary>
   
</member>
<member name="M:AcDbXrefFileLocker.Dispose" decl="true" source="c:\objectarx\inc\xreflock.h" line="107">
<summary> Just calls release(). </summary>

</member>
<member name="M:AcDbXrefFileLocker.release" decl="true" source="c:\objectarx\inc\xreflock.h" line="111">
<summary>
Saves changes made to the XREF database back to the XREF file and releases the file lock.
Subsequent release() calls are no-ops. setSaveBack() allows to control whether to save the 
changes back to the file or not. If status() != Acad::eOk, it does not update the XREF file.
</summary>

</member>
<member name="M:AcDbXrefFileLocker.status" decl="true" source="c:\objectarx\inc\xreflock.h" line="119">
<summary>
If anything went wrong, non-eOk ErrorStatus is returned.
</summary>

</member>
<member name="M:AcDbXrefFileLocker.setSaveBackToXrefFile(System.Boolean)" decl="true" source="c:\objectarx\inc\xreflock.h" line="125">
<summary>
By default changes made to the XREF database are saved back to the XREF file 
on release() (or destructor) call. This allows not to save back to the XREF file, 
e.g. when the client operation didn't succeed.
</summary>

</member>
<member name="M:AcDbXrefFileLocker.collectAllOpenedObjects(AcArray&lt;AcDbObjectId&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\xreflock.h" line="137">
<summary>
Collects all AcDbObjects in the XREF database that are opened and that need to be 
temporarily closed before the modified XREF database is saved to the file, and then 
reopened.
</summary>

</member>
<member name="M:acdbValidateDbConsistency(AcDbObject*,AcDbObjectId,Acad.ErrorStatus)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="76">
<summary>
Verify that an object and an objectId belongs to the same database,
and that no cross database references exist.
For database resident objects the database of the objectId will be compared
with the objects database.
For non database resident objects the objects intended database will be
used. If the object has no intended database it will be set by this function.
</summary>
<param name="pHostObject">The object holding the object Id.</param>
<param name="objId">The object Id to validate.</param>
<param name="es">Optional. Previous Acad::ErrorStatus.
    That allows you to compute multiple results and chain them
    while preserving the first bad error status.</param>
<returns>
    Returns Acad::eOk if the operation completed sucessfully.
    Returns Acad::eWrongDatabase if the databases are different.
    Returns the 'es' argument directly if es != Acad::eOk
</returns>
</member>
<member name="M:acdbValidateDbConsistency(AcDbObject*,AcDbDatabase*,Acad.ErrorStatus)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="98">
<summary>
Verify that an object does not have cross database references.
For database resident objects the database will be compared with the
objects database.
For non database resident objects the objects intended database will be
used. If the object has no intended database it will be set by this function.
</summary>
<param name="pHostObject">The object holding the object Id.</param>
<param name="pDatabase">The target database to validate.</param>
<param name="es">Optional. Previous Acad::ErrorStatus.
    That allows you to compute multiple results and chain them
    while preserving the first bad error status.</param>
<returns>
    Returns Acad::eOk if the operation completed sucessfully.
    Returns Acad::eWrongDatabase if the databases are different
    Returns the 'es' argument directly if es != Acad::eOk
</returns>
</member>
<member name="M:acdbGetMappedFontName(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="119">
<summary>
Map the font that will be used given a font name.
</summary>
<param name="fontName">Input font name.</param>
<returns>A mapped(substitute) font name or NULL if there is no substitution.
</returns>
</member>
<member name="M:acdbQueueAnnotationEntitiesForRegen(AcDbDatabase*)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="127">
<summary>
  Queue an entity in model space for regen if it is:
  1) annotative, or
  2) a block reference with some nested annotative entity
  3) an attribute on an annotative block reference
</summary>
<param name="pDb">Input database to get the model space from.</param>
<returns>Returns Acad::eOk if the operation completed sucessfully.</returns>
</member>
<member name="M:acdbPSLayoutAnnoAllVisible(AcDbObjectId)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="137">
<summary>
Determines whether the sysvar ANNOALLVISIBLE is set for the layout that
owns the viewport whose objectId is viewportEntityId.
</summary>
<param name="viewportEntityId">Input objectId of a viewport whose owning layout is to be checked for ANNOALLVISIBLE.</param>
<returns>Returns 1 if ANNOALLVISIBLE is set and 0 if ANNOALLVISIBLE is not set for the layout.</returns>
</member>
<member name="M:acdbPSLayoutAnnoAllVisible(AcDbViewport*)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="145">
<summary>
Determines whether the sysvar ANNOALLVISIBLE is set for the layout that
owns the viewport pointed to by pVport.
</summary>
<param name="pVport">Input pointer to an AcDbViewport whose owning layout is to be checked for ANNOALLVISIBLE.</param>
<returns>Returns 1 if ANNOALLVISIBLE is set and 0 if ANNOALLVISIBLE is not set for the layout.</returns>
</member>
<member name="M:acdbGetCurUserViewportId(AcDbDatabase*,AcDbObjectId*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="153">
<summary>
This function returns the object ID of the AcDbViewport that was current before
any draw methods are called on any entity in the database.  The entity draw methods
can manipulte what is the current viewport.
</summary>
<param name="pDb">Input database to get the object ID of the AcDbViewport from.</param>
<param name="vpId">Output object ID of the AcDbViewport.</param>
<returns>Returns Acad::eOk if completed sucessfully.</returns>
</member>
<member name="T:AcDbDisableAnnoAutoScale" decl="false" source="c:\objectarx\inc\dbxutil.h" line="167">
<summary>
AcDbAnnotationScale is a helper class.
By instantiating a local variable to use this class, the constructor of the class,
saves off the current value of the sysvar, ANNOAUTOSCALE, and sets ANNOAUTOSCALE
to zero.  Then when the local variable goes out of scope the destructor of this
class returns ANNOAUTOSCALE to its original value.
</summary>

</member>
<member name="M:acdbAddConstrainedGeometryDraggingInfo(AcConstrainedGeometryDraggingInfo!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="554">
<summary>
 This API can be used to push the dragging info of an constraint 
 geometry into the AutoCAD dragger. Basically, it allows client
 to add additional sub entities that needs to be transformed 
 along with actual sub entities that are moved through grip or
 stretch operation.
 This API should be used only when host application is AutoCAD.
 Also, this should be called only during the dragging.
 </summary>
 <param name="pDraggingInfo"> dragging info of the constraint geometry
 </param>
 <returns> Error Status. For cases where host application is not 
 a AutoCAD and it's not in the middle of dragger, it would return 
 eNotApplicable.
 </returns>
</member>
<member name="M:acdbConvertAcDbCurveToGelibCurve(AcDbCurve!System.Runtime.CompilerServices.IsConst*,AcGeCurve3d**!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeTol!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="572">
<summary>
This function takes an AcDbCurve and returns an AcGeCurve3d that is
geometrically identical to the AcDbCurve.
</summary>
<param name="dbCurve">Input reference to an AcDbCurve.</param>
<param name="pGeCurve">Output pointer to an AcGeCurve3d object that is
geometrically identical to dbCurve.  The caller of this function is
responsible for deleting this AcGeCurve3d object.</param>
<param name="tol">Optional input tolerance.</param>
<returns>Returns eOk if successful.</returns>
</member>
<member name="M:acdbConvertGelibCurveToAcDbCurve(AcGeCurve3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbCurve**!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcGeVector3d*,AcGeTol!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="585">
<summary>
This function takes an AcGeCurve3d and returns an AcDbCurve that is
geometrically identical to the AcGeCurve3d.
</summary>
<param name="geCurve">Input reference to an AcGeCurve3d.</param>
<param name="pDbCurve">Output pointer to an AcDbCurve object that is
geometrically identical to geCurve.  The caller of this function is
responsible for deleting this AcDbCurve object or adding it to the
database.</param>
<param name="normal">Optional normal vector.  If this parameter is 
supplied then it must be a valid vector that is perpendicular to the
input geCurve, and this vector will become the normal vector of
the output pDbCurve.  If this parameter is not supplied, then this
function will compute the normal vector itself.</param>
<param name="tol">Optional input tolerance.</param>
<returns>Returns eOk if successful.</returns>
</member>
<member name="M:acdbAssignGelibCurveToAcDbCurve(AcGeCurve3d!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcDbCurve*,AcGeVector3d*,AcGeTol!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\dbxutil.h" line="604">
<summary>
This function takes an AcGeCurve3d and sets the specified AcDbCurve
to be geometrically identical to the AcGeCurve3d.
</summary>
<param name="geCurve">Input reference to an AcGeCurve3d.</param>
<param name="pDbCurve">Pointer to an existing AcDbCurve object that must
be open for write and of a compatible type to the AcGeCurve3d.</param>
<param name="normal">Optional normal vector.  If this parameter is 
supplied then it must be a valid vector that is perpendicular to the
input geCurve, and this vector will become the normal vector of
the output pDbCurve.  If this parameter is not supplied, then this
function will compute the normal vector itself.</param>
<param name="tol">Optional input tolerance.</param>
<returns>Returns eOk if successful.</returns>
</member>
<member name="T:AcDbDatabaseSummaryInfo" decl="false" source="c:\objectarx\inc\eoktest.h" line="61">
<summary>
Evaluates to true if value is Acad::eOk, otherwise evaluates to false.
</summary>
<summary>
Asserts if value is not Acad::eOk.  Evaluates to the value.
</summary>
<summary>
Asserts if value is not Acad::eOk.  Evaluates to true if value is Acad::eOk
otherwise evalutes to false.
</summary>
</member>
<member name="M:AcEdInputPointManager.addSubSelectFilter(AcEdSubSelectFilter*)" decl="false" source="c:\objectarx\inc\acedinpt.h" line="175">
 This method registers a sub-selection filter

  @param  pSSSubFilter    the sub-selection filter to be registered.
  
  @returns eSelectFilterError if there is an error when trying to
  initialize the filter data, e.g. get a list of AcRxClass* that this
  filter applies to. Otherwise, eOk.

</member>
<member name="M:AcEdInputPointManager.removeSubSelectFilter(AcEdSubSelectFilter*)" decl="false" source="c:\objectarx\inc\acedinpt.h" line="187">
 This method unregisters a sub-selection filter

 @param   pSSubFilter   the sub-selection filter to be unregistered.

 @returns eKeyNotFound if the object does not exist. eOk otherwise.

</member>
<member name="M:AcEditorReactor.xrefSubCommandStart(AcXrefSubCommand,AcArray&lt;AcDbObjectId&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Char!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\aced.h" line="499">
<summary>

 Sends notification on the start of an xref subcommand. The xref
 subcommands are the ones in the following enum (aced.h):
 
    enum AcXrefSubCommand {
                 kAttach,
                 kBind,
                 kDetach,
                 kOverlay,
                 kPath,
                 kReload,
                 kResolve,
                 kUnload,
                 kXBind
    };

  An application can veto the operation by returning a bad status,
  e.g. Acad::eVetoed.

  There are multiple output arguments, based on the subcommand.
  Subcommands like attach have all the arguments provided.
  Subcommands like Bind only supply the btrids.
  
  The rule for checking the output arguments is: Use the BtrIds first.
  The other two arguments may be empty.
  In subcommands like Path - the path in the Block Table Record could
  differ from the one in the paths argument - in which case - both
  could be used.

</summary>

<param name="subcmd">
The subcommand which is about to start.
</param>

<param name="btrIds">
The xref block table record ids. The primary output argument.
</param>

<param name="btrNames">
 Xref Block Table Record names.
</param>

<param name="paths">
The path strings for the subcommand, if applicable.
</param>

<returns>
Returns Acad::eOk if successful. If the application return an
error status, the subcommand will be vetoed.
</returns>

<remarks>
 Though the btr names and path arguments seem redundant at times,
 they can help applications avoid open for write/open for read conflicts
 in case the subcommand already has the Block Table Record open.
</remarks>

</member>
<member name="M:AcEditorReactor.preXrefLockFile(AcDbObjectId)" decl="true" source="c:\objectarx\inc\aced.h" line="565">
<summary>
Notification just before an Xref is locked via 
AcEdXrefFileLock::lockFile().
</summary>

<param name="btrId">
The xref block table record id that is to be locked.
</param>

</member>
<member name="M:acedGetUnitsConversion(AcDb.UnitsValue,System.Double*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\aced.h" line="908">
<summary>
This function computes the conversion factor that blocks and xrefs 
need to be scaled duing insertion to retain their size.  So for example, 
if a block that is created using feet as its units is inserted into a drawing
with inches as its units, the conversion will be 12.
</summary>
<param name="blkInsunits">Input units that the block is created with.</param>
<param name="conversionFactor">Return the conversion factor between the block's
units and the current drawing's units.</param>
<returns>Returns true if a conversion factor was computed.</returns>
</member>
<member name="M:acedGetAnimationFrameId" decl="true" source="c:\objectarx\inc\aced.h" line="954">
<summary>
Provides the id of the last frame rendered in animations invoked from the 
ANIPATH command 
</summary>
<returns>
Returns 0 when ANIPATH animation is inactive.  The first frame of an
an ANIPATH animation returns 1, and subsequent frames increment by 1 
from the previous frame.  
</returns>
</member>
<member name="M:acedShowConstraintBar(AcArray&lt;AcDbFullSubentPath,AcArrayObjectCopyReallocator&lt;AcDbFullSubentPath&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\aced.h" line="965">
<summary>This function is used to show the constraint bars for a given 
set of constrained entities.</summary>
<param name="subentPaths">Full sub-entity paths of entities for which 
constraint bars are to be shown.</param>
<returns>Returns true if successful, or false otherwise.</returns>
</member>
<member name="M:acedHideConstraintBar(AcArray&lt;AcDbFullSubentPath,AcArrayObjectCopyReallocator&lt;AcDbFullSubentPath&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\aced.h" line="972">
<summary>This function is used to hide the constraint bars for a given 
set of constrained entities.</summary>
<param name="subentPaths">Full sub-entity paths of entities for which 
constraint bars are to be hidden.</param>
<returns>Returns true if successful, or false otherwise.</returns>
</member>
<member name="M:acedShowConstraintBarForAll(System.Boolean)" decl="true" source="c:\objectarx\inc\aced.h" line="979">
<summary>This function is used to show or hide the constraint bars for 
all constrained entities in the active document.</summary>
<param name="bToShow">Set this to true to show constraint bars,
set to false to hide constraint bars. </param>
<returns>Returns true if successful, or false otherwise.</returns>
</member>
<member name="F:kDisableDirectDistanceInput" decl="false" source="c:\objectarx\inc\dbjig.h" line="57">
<summary> Disables direct distance input. When this flag is ON a
distance input such as integer or real will not be accepted unless
kAcceptOtherInputString is ON, in that case returned DragStatus is
kOther. </summary>
</member>
<member name="M:AcApDocument.view" decl="true" source="c:\objectarx\inc\acdocman.h" line="178">
<summary>
Retrieves the one and only view associated with this document.
</summary>
</member>
<member name="D:PCWIDESTR" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="15">
<summary>
This file describes the following objects
AcDMMWideString - a simple Unicode string class
AcDMMStringVec - a vector of AcDMMWideStrings
AcDMMNode - which encapsulates a w2d Node
AcDMMResourceInfo - which contains the description of one resource
AcDMMResourceVec - a vector of AcDMMResourceInfo objects
(file) to the added to the DWF page or to the ePlot global section
</summary>
</member>
<member name="T:AcDMMWideString" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="38">
<summary>
a simple unicode string class
</summary>

<remarks>
Cheap Unicode string class.  No fancy use-counting.
Just meant to "look" like CString as far as we use it.
</remarks>
</member>
<member name="M:AcDMMWideString.#ctor" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="49">
<summary>
default constructor
</summary>

</member>
<member name="M:AcDMMWideString.#ctor(AcDMMWideString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="55">
<summary>
copy constructor
</summary>

<param name="ws">
the string to be copied into this
</param>

</member>
<member name="M:AcDMMWideString.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="65">
<summary>
Constructs this from a pointer to a Unicode string
</summary>

<param name="pwsz">
a pointer to the null terminated Unicode string from which this
object shall be constructed.
</param>

</member>
<member name="M:AcDMMWideString.Dispose" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="76">
<summary>
destructor
</summary>

</member>
<member name="M:AcDMMWideString.op_Assign(AcDMMWideString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="82">
<summary>
operator= for copying another AcDMMWideString
</summary>

<param name="ws">
a const reference to the AcDMMWideString which is to be
copied to this
</param>

<returns>
a const reference to this
</returns>

</member>
<member name="M:AcDMMWideString.op_Assign(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="97">
<summary>
operator= for copying a null terminated Unicode string into this
</summary>

<param name="pwsz">
a const pointer to a null terminated Unicode string to be copied
to this
</param>

<returns>
a const reference to this
</returns>

</member>
<member name="M:AcDMMWideString.op_Implicit~System.Char!System.Runtime.CompilerServices.IsConst*" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="112">
<summary>
returns a const pointer to the Unicode string contained by this
</summary>

<returns>
returns a const pointer to the Unicode string contained by this
</returns>

</member>
<member name="M:AcDMMWideString.Empty" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="122">
<summary>
deletes the contained Unicode string
</summary>

</member>
<member name="M:AcDMMWideString.IsEmpty" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="128">
<summary>
tells the caller if this contains an empty string
</summary>

<returns>
returns true if this contains an empty string
</returns>
</member>
<member name="M:AcDMMWideString.GetLength" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="137">
<summary>
get the length of the contained string, in Unicode characters
</summary>

<returns>
the length of the contained string, in Unicode characters
</returns>

</member>
<member name="M:AcDMMWideString.op_AdditionAssignment(AcDMMWideString)" decl="true" source="c:\objectarx\inc\acdmmutils.h" line="147">
<summary>
concatenates a second AcDMMWideString to this one
</summary>

<param name="ws">
the AcDMMWideString to concatenate with this one
</param>

<returns>
a const reference to this
</returns>
</member>
<member name="T:AcDMMNode" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="364">
class AcDMMNode
<summary>
a lightweight object to hold the data needed to describe a Node in
a DWF w2d
</summary>
</member>
<member name="M:AcDMMNode.#ctor" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="373">
<summary>
default constructor
</summary>

<remarks>
creates an empty node with number 0
</remarks>
</member>
<member name="M:AcDMMNode.#ctor(System.Int32,System.Char*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="386">
<summary>
constructs a node from a name and number
</summary>

<param name="number">
The integer Node number.
</param>

<param name="name">
a Unicode string defining the Node name
</param>

</member>
<member name="M:AcDMMNode.#ctor(AcDMMNode!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="410">
<summary>
Copy constructor
</summary>

<param name="src">
the object to be copied
</param>

</member>
<member name="M:AcDMMNode.Dispose" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="425">
<summary>
destructor
</summary>

</member>
<member name="M:AcDMMNode.nodeNumber" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="435">
<summary>
accessor for the Node number
</summary>

<returns>
the integer Node number
</returns>
</member>
<member name="M:AcDMMNode.SetNodeNumber(System.Int32)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="444">
<summary>
mutator for the Node number
</summary>

<param name="number">
the integer value to assign as Node number
</param>
</member>
<member name="M:AcDMMNode.nodeName" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="454">
<summary>
accessor for the Node name
</summary>

<returns>
a const pointer to the null terminated Unicode Node name string
</returns>
</member>
<member name="M:AcDMMNode.SetNodeName(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="463">
<summary>
mutator for the Node name
</summary>

<param name="name">
a const pointer to a Unicode string to be assigned as Node name
</param>
</member>
<member name="M:AcDMMNode.op_Assign(AcDMMNode!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="485">
<summary>
operator= also used by copy constructor
</summary>

<param name="src">
the object whose values will be copied to this object
</param>

<returns>
returns this object
</returns>
</member>
<member name="T:AcDMMResourceInfo" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="515">
<summary>
This class describes a resource to be added to the DWF page or global 
section
The resource is an existing file which will be added to the zip
file and listed in the page descriptor as a page resource or added
to the ePlot global section as a global resource
</summary>
</member>
<member name="M:AcDMMResourceInfo.#ctor" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="525">
<summary>
the default constructor, creates an empty object
</summary>
</member>
<member name="M:AcDMMResourceInfo.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="535">
<summary>
creates an AcDMMResourceInfo object from 3 Unicode strings
</summary>

<param name="role">
a null terminated Unicode string to be assigned to the role attribute
This string describes the resource, e.g, "thumbnail", "font", etc.
</param>

<param name="mime">
this is a null terminated Unicode strings to be assigned to the mime
type attribute. 
</param>

<param name="path">
This is a Unicode string holding the full path to the resource file
</param>
</member>
<member name="M:AcDMMResourceInfo.#ctor(AcDMMResourceInfo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="580">
<summary>
Copy constructor
</summary>

<param name="src">
the object to be copied
</param>

</member>
<member name="M:AcDMMResourceInfo.Dispose" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="597">
<summary>
destructor
</summary>    
</member>
<member name="M:AcDMMResourceInfo.SetRole(System.Char*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="610">
<summary>
mutator for the Role attribute
</summary>

<param name="role">
a const pointer to a Unicode string to be assigned as role
</param>
</member>
<member name="M:AcDMMResourceInfo.SetRole(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="632">
<summary>
mutator for the Role attribute
</summary>

<param name="role">
a const pointer to a Unicode string to be assigned as role
</param>
</member>
<member name="M:AcDMMResourceInfo.GetRole" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="654">
<summary>
accessor for the Role attribute
</summary>

<returns>
a const pointer to the null terminated Unicode Node role string
</returns>
</member>
<member name="M:AcDMMResourceInfo.SetMime(System.Char*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="663">
<summary>
mutator for the Mime attribute
</summary>

<param name="mime">
a const pointer to a Unicode string to be assigned as mime
</param>
</member>
<member name="M:AcDMMResourceInfo.SetMime(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="685">
<summary>
mutator for the Mime attribute
</summary>

<param name="mime">
a const pointer to a Unicode string to be assigned as mime
</param>
</member>
<member name="M:AcDMMResourceInfo.GetMime" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="706">
<summary>
accessor for the Mime type attribute
</summary>

<returns>
a const pointer to the null terminated Unicode mime type string
</returns>
</member>
<member name="M:AcDMMResourceInfo.SetPath(System.Char*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="715">
<summary>
mutator for the Path attribute
</summary>

<param name="path">
a const pointer to a Unicode string to be assigned as path to the
resource file
</param>
</member>
<member name="M:AcDMMResourceInfo.SetPath(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="738">
<summary>
mutator for the Path attribute
</summary>

<param name="path">
a const pointer to a Unicode string to be assigned as path to the
resource file
</param>
</member>
<member name="M:AcDMMResourceInfo.GetPath" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="761">
<summary>
accessor for the path to the resource file
</summary>

<returns>
a const pointer to the null terminated Unicode path string
</returns>
</member>
<member name="M:AcDMMResourceInfo.op_Assign(AcDMMResourceInfo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="770">
<summary>
operator= also used by copy constructor
</summary>

<param name="src">
the object whose values will be copied to this object
</param>

<returns>
returns this object
</returns>
</member>
<member name="T:AcDMMXMLAttribute" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="23">
<summary>
This is a subsidiary class to AcDMMEplotProperty defined below.
You generally don't need to use this class.

Normal attributes, i.e. those predefined by Dwf such as name, value, units, etc.,
are added to an AcDMMEplotProperty using its built-in methods such as SetUnits.

Applications that define their own private namespaces and want to publish attributes
belonging to those namespaces need to use this class.
</summary>

<remarks>
On the publishing side, you generally don't need to create elements of this class, and can add
your elements to an AcDMMEplotProperty by using
	AcDMMEplotProperty::AddXMLAttribute(const wchar_t *ns, const wchar_t *nsUrl, 
                                        const wchar_t *attName, const wchar_t *attValue);
You will need this class mainly to read and interpret the existing vector of attributes
returned by AcDMMEplotProperty::GetXMLAttributes().
</remarks>

</member>
<member name="M:AcDMMXMLAttribute.#ctor" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="47">
<summary>
Default constructor
</summary>

<remarks> initializes data members to an empty state
</remarks>

</member>
<member name="M:AcDMMXMLAttribute.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="59">
<summary>
constructs an AcDMMXMLAttribute wrapping a namespace, namespace 
location, attribute name and attribute value
</summary>

<param name="ns">
a non-empty Unicode string supplying the namespace "tag" of the property
</param>

<param name="nsUrl">
a non-empty Unicode string supplying a namespace URI for the property
</param>

<param name="attName">
a Unicode string supplying the hidden attribute name of the property
</param>

<param name="attValue">
a Unicode string supplying the hidden attribute value for the property
this must not exceed 8192 bytes after xml encoding
</param>

<remarks> An AcDMMXMLAttribute must contain non-null values for all parameters,
otherwise it will be ignored. Empty strings ("") for the namespace parameters will
cause undefined behavior.
</remarks>

</member>
<member name="M:AcDMMXMLAttribute.op_Assign(AcDMMXMLAttribute!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="96">
<summary>
operator= also used by the copy constructor
</summary>

<param name="src">
the object whose values will be copied to this object
</param>

<returns>
a const reference to this
</returns>

</member>
<member name="M:AcDMMXMLAttribute.#ctor(AcDMMXMLAttribute!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="121">
<summary>
Copy Constructor
</summary>

<param name="src">
The object to copy from
</param>

</member>
<member name="M:AcDMMXMLAttribute.Dispose" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="134">
<summary>
Destructor
</summary>

<remarks>
The string data in the property is freed by this destructor
</remarks>

</member>
<member name="M:AcDMMXMLAttribute.SetNamespace(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="154">
<summary>
mutator for the namespace xml attribute
</summary>

<param name="ns">
A Unicode string setting the namespace of the property
</param>

</member>
<member name="M:AcDMMXMLAttribute.GetNamespace" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="175">
<summary>
accessor for the namespace of the xml attribute
</summary>

<returns>
Returns a const pointer to the Unicode xml namespace string
</returns>

</member>
<member name="M:AcDMMXMLAttribute.SetNamespaceUrl(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="188">
<summary>
mutator for the namespace location of the xml attribute
</summary>

<param name="nsUrl">
A Unicode string setting the namespace location of the property
</param>

</member>
<member name="M:AcDMMXMLAttribute.GetNamespaceUrl" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="209">
<summary>
accessor for the namespace location of the xml attribute
</summary>

<returns>
Returns a const pointer to the Unicode namespace location string
</returns>

</member>
<member name="M:AcDMMXMLAttribute.SetAttributeName(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="222">
<summary>
mutator for the xml attribute name
</summary>

<param name="attName">
A Unicode string setting the attribute name of the property
</param>

</member>
<member name="M:AcDMMXMLAttribute.GetAttributeName" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="243">
<summary>
accessor for the xml attribute name
</summary>

<returns>
Returns a const pointer to the Unicode xml attribute name string
</returns>

</member>
<member name="M:AcDMMXMLAttribute.SetAttributeValue(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="256">
<summary>
mutator for the xml attribute value
</summary>

<param name="attValue">
A Unicode string setting the xml attribute value of the property
</param>

</member>
<member name="M:AcDMMXMLAttribute.GetAttributeValue" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="277">
<summary>
accessor for the xml attribute value
</summary>

<returns>
Returns a const pointer to the xml attribute value string
</returns>

</member>
<member name="T:AcDMMEPlotProperty" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="311">
<summary>
This class is a lightweight proxy for the DWF EPlotProperty object.
It allows clients of the DMM (DWF Metadata Manager) API to add
properties to an AcDMMEPlotProperties object which in turn
is used to associate properties with an entity in a DWF file
without linking to the DWF toolkit
</summary>

<remarks>
This is just a container for Unicode strings. Two of these are required,
the property name and its value. The other three are optional. If the 
strings are not already XML encoded, they will be encoded when this 
object is converted to the corresponding DWF toolkit object and this
can result in significant expansion of the string due to the
escaping of reserved characters. The maximum length of any encoded
attribute string is 8192 bytes.
</remarks>

</member>
<member name="M:AcDMMEPlotProperty.#ctor" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="333">
<summary>
Default constructor
</summary>

<remarks> initializes data members to an empty state
</remarks>

</member>
<member name="M:AcDMMEPlotProperty.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="349">
<summary>
constructs an AcDMMEPlotProperty wrapping a name and value
</summary>

<param name="name">
a Unicode string supplying the name of the property
</param>

<param name="value">
a Unicode string supplying a value for the property
this must not exceed 8192 bytes after xml encoding
</param>

<remarks> can construct from two wide strings supplying just 
the property name and property value. 
</remarks>

</member>
<member name="M:AcDMMEPlotProperty.#ctor(AcDMMEPlotProperty!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="390">
<summary>
Copy Constructor
</summary>

<param name="src">
The object to copy from
</param>

</member>
<member name="M:AcDMMEPlotProperty.Dispose" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="409">
<summary>
Destructor
</summary>

<remarks>
The string data in the property is freed by this destructor
</remarks>

</member>
<member name="M:AcDMMEPlotProperty.SetType(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="431">
<summary>
mutator for the optional Type attribute
</summary>

<param name="type">
A Unicode string setting the DWF type of the property
</param>

<remarks>
type is an optional Unicode string
   
some recognized type name strings:
String_List_Type "string"
Boolean_Type "boolean"
UriReference_Type "uriReference"
TimeDuration_Type "timeDuration"
TimeInstant_Type "timeInstant"
Date_Type "date"
Month_Type "month"
Year_Type "year"
Century_Type "century"
RecurringDate_Type "recurringDate"
RecurringDay_Type "recurringDay"
Float_Type "float"
Double_Type "double"
Double_List_Type "doubleList"
Long_Type  "long"
Long_List_Type; "longList"
Int_Type "int"
Short_Type "short"
Byte_Type "byte"
UnsignedLong_Type "unsignedLong"
UnsignedInt_Type "unsignedint"
UnsignedShort_Type "unsignedShort"
UnsignedByte_Type "unsignedByte"
StringList_Type "stringList"

Note: the List types are space separated lists of values 
</remarks>
</member>
<member name="M:AcDMMEPlotProperty.GetType" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="487">
<summary>
accessor for the optional Type attribute
</summary>

<returns>
Returns a const pointer to the Unicode Type string
</returns>
</member>
<member name="M:AcDMMEPlotProperty.SetUnits(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="500">
<summary>
mutator for the optional Units attribute
</summary>

<param name="units">
A Unicode string setting the DWF units of the property
</param>

<remarks>
The units string is appended to the value string by the viewer
when displaying properties. The convention is that they should be
English and obvious, e.g., standard, abbreviations wherever possible.
Examples include mm, cm, m, km, in, ft, yd and mi.
</remarks>
</member>
<member name="M:AcDMMEPlotProperty.GetUnits" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="531">
<summary>
accessor for the optional Units attribute
</summary>

<returns>
Returns a const pointer to the Unicode Units string
</returns>
</member>
<member name="M:AcDMMEPlotProperty.SetCategory(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="544">
<summary>
mutator for the optional Category attribute
</summary>

<param name="category">
A Unicode string setting the category of the property
</param>

<remarks>
category is a Unicode string property for categorizing objects
The category string is displayed in the DWF viewer properties window
Clients may use category in various ways. The viewer recognizes one
magic category, hidden, which will cause it not to display the 
property.
</remarks>

</member>
<member name="M:AcDMMEPlotProperty.GetCategory" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="578">
<summary>
accessor for the optional Category attribute
</summary>

<returns>
Returns a const pointer to the Unicode Category string
</returns>

</member>
<member name="M:AcDMMEPlotProperty.SetName(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="592">
<summary>
mutator for the required property Name attribute
</summary>

<param name="name">
A Unicode string setting the name of the property
</param>

<remarks>
the name is a Unicode string property 
The name string is displayed in the DWF viewer properties window
</remarks>

</member>
<member name="M:AcDMMEPlotProperty.GetName" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="623">
<summary>
accessor for the required property name attribute
</summary>

<returns>
Returns a const pointer to the Unicode name string
</returns>

</member>
<member name="M:AcDMMEPlotProperty.SetValue(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="636">
<summary>
mutator for the reqiured property Value attribute
</summary>

<param name="value">
A Unicode string setting the value of the property
</param>

<remarks>
value is a Unicode string property for objects
The value string is displayed in the DWF viewer properties window
</remarks>
</member>
<member name="M:AcDMMEPlotProperty.GetValue" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="665">
<summary>
accessor for the required proterty Value attribute
</summary>

<returns>
Returns a const pointer to the Unicode Value string
</returns>

</member>
<member name="M:AcDMMEPlotProperty.op_Assign(AcDMMEPlotProperty!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="678">
<summary>
operator= also used by the copy constructor
</summary>

<param name="src">
the object whose values will be copied to this object
</param>

<returns>
a const reference to this
</returns>

</member>
<member name="M:AcDMMEPlotProperty.AddXMLAttribute(AcDMMXMLAttribute!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="704">
<summary>
Adds a new AcDMMXMLAttribute object to the internal 
vector of XML Attributes.
</summary>

<param name="attrib">
a const pointer to the XMLAttibute that needs to be added to the
vector of XML attributes
</param>

</member>
<member name="M:AcDMMEPlotProperty.AddXMLAttribute(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="723">
<summary>
Creates and adds a new AcDMMXMLAttribute object to the internal 
vector of XML Attributes.
</summary>

<param name="ns">
the new Attribute's namespace name
</param>

<param name="nsUrl">
the new Attribute's namepsace location
</param>

<param name="attName">
the new Attribute's name
</param>

<param name="value">
the new Attribute's value
</param>

</member>
<member name="M:AcDMMEPlotProperty.GetXMLAttributes" decl="false" source="c:\objectarx\inc\acdmmeplotproperty.h" line="750">
<summary>
accessor for the internal vector of AcDMMXMLAttribute objects
contained by this object
</summary>

<returns>
Returns a const reference to the internal Vector of 
AcDMMXMLAttribute objects contained by this object
</returns>
</member>
<!-- 丢弃成员“T:AcNameValuePair”的格式错误的 XML 文档注释。 -->
<member name="M:AcNameValuePair.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="42">
<summary>
default constructor
</summary>

<remarks>
creates an empty name value pair
</remarks>
</member>
<member name="M:AcNameValuePair.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="55">
<summary>
destructor
</summary>

</member>
<member name="M:AcNameValuePair.#ctor(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="67">
<summary>
constructs a name value pair from a name and a value
</summary>

<param name="name">
a string defining the name, a null-terminated mbcs string
</param>

<param name="value">
The value string, a null-terminated msbcs string.
</param>

</member>
<member name="M:AcNameValuePair.#ctor(AcNameValuePair!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="98">
<summary>
Copy constructor
</summary>

<param name="src">
the object to be copied
</param>

</member>
<member name="M:AcNameValuePair.name" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="113">
<summary>
accessor for the item name
</summary>

<returns>
a const pointer to the null terminated mbcs name string
</returns>
</member>
<member name="M:AcNameValuePair.value" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="123">
<summary>
accessor for the item value
</summary>

<returns>
a const pointer to the null terminated mbcs value string
</returns>
</member>
<member name="M:AcNameValuePair.setName(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="132">
<summary>
mutator for the item name
</summary>

<param name="name">
a const pointer to an mbcs string to be assigned as item name
</param>
</member>
<member name="M:AcNameValuePair.setValue(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="152">
<summary>
mutator for the item value
</summary>

<param name="value">
a const pointer to an mbcs string to be assigned as item value
</param>
</member>
<member name="M:AcNameValuePair.op_Assign(AcNameValuePair!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="173">
<summary>
operator= also used by copy constructor
</summary>

<param name="src">
the object whose values will be copied to this object
</param>

<returns>
returns this object
</returns>
</member>
<member name="T:AcPublishBeforeJobInfo" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="203">
<summary>
This class is the context information supplied by the 
OnAboutToBeginBackgroundPublishing notifier of AcPublishReactor. 
You do not need to construct this class. This is handed to the 
OnAboutToBeginBackgroundPublishing method.
</summary>
</member>
<member name="M:AcPublishBeforeJobInfo.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="213">
<summary>
default constructor
</summary>

<remarks>
creates an empty AcPublishBeforeJobInfo. Clients do not
construct this object, it is created by the DMM and handed
to their reactors
</remarks>
</member>
<member name="M:AcPublishBeforeJobInfo.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="224">
<summary>
destructor
</summary>

</member>
<member name="M:AcPublishBeforeJobInfo.GetDSDData" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="230">
<summary>
read only accesss to the DSD object
</summary>

<returns>
a const pointer to the DSD object for this publish job
</returns>
</member>
<member name="M:AcPublishBeforeJobInfo.GetPrivateData(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="239">
<summary>
read/write access to the client's private DSD data
</summary>

<param name="sectionName">
the name the client assigned to its private DSD data section
as a null terminated mbcs string.
</param>

<returns>
returns empty AcNameValuePairVec, if section not found, 
otherwise this returns a const AcNameValuePairVec object with
name value pairs for the section requested.
</returns>
</member>
<member name="M:AcPublishBeforeJobInfo.WritePrivateSection(System.Char!System.Runtime.CompilerServices.IsConst*,AcArray&lt;AcNameValuePair&gt;!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="256">
<summary>
replaces a section of the same name
will fail if it attempts to replace a "recognized" section of
standard DSD data
returns true on success, false on error
</summary>

<param name="sectionName">
the name the client assigned to its private DSD data section
as a null terminated mbcs string.
</param>


<param name="nameValuePairVec">
Vector of name and value pairs that clients want to update in their
section in the dsd file
</param>

<returns>
returns true if section data is updated in the dsd data object
successfully, otherwise returns false.
</returns>
</member>
<member name="T:AcPublishBeginJobInfo" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="285">
<summary>
This class is the context information supplied by the 
OnAboutToBeginPublishing  notifier of AcPublishReactor. 
You do not need to construct this class. This is handed to the 
OnAboutToBeginPublishing  method.
</summary>
</member>
<member name="M:AcPublishBeginJobInfo.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="295">
<summary>
default constructor
</summary>

<remarks>
creates an empty AcPublishBeginJobInfo. Clients do not
construct this object, it is created by the DMM and handed
to their reactors
</remarks>
</member>
<member name="M:AcPublishBeginJobInfo.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="306">
<summary>
destructor
</summary>

</member>
<member name="M:AcPublishBeginJobInfo.GetDSDData" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="312">
<summary>
read only accesss to the DSD object
</summary>

<returns>
a const pointer to the DSD object for this publish job
</returns>
</member>
<member name="M:AcPublishBeginJobInfo.GetPrivateData(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="321">
<summary>
read/write access to the client's private DSD data
</summary>

<param name="sectionName">
the name the client assigned to its private DSD data section
as a null terminated mbcs string.
</param>

<returns>
returns empty AcNameValuePairVec, if section not found, 
otherwise this returns a const AcNameValuePairVec object with
name value pairs for the section requested.
</returns>
</member>
<member name="M:AcPublishBeginJobInfo.WritePrivateSection(System.Char!System.Runtime.CompilerServices.IsConst*,AcArray&lt;AcNameValuePair&gt;!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="338">
<summary>
replaces a section of the same name
will fail if it attempts to replace a "recognized" section of
standard DSD data
returns true on success, false on error
</summary>

<param name="sectionName">
the name the client assigned to its private DSD data section
as a null terminated mbcs string.
</param>


<param name="nameValuePairVec">
Vector of name and value pairs that clients want to update in their
section in the dsd file
</param>

<returns>
returns true if section data is updated in the dsd data object
successfully, otherwise returns false.
</returns>
</member>
<member name="M:AcPublishBeginJobInfo.GetPlotLogger" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="367">
<summary>
provides access to the plot logger object
</summary>

<returns>
a pointer to the plot logger used by Publish
</returns>

<remarks>
clients don't need to create or destroy this object
</remarks>
</member>
<member name="T:AcPublishSheetInfo" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="381">
<summary>
This class is the context information supplied by the 
OnBeginPublishingSheet notifier of AcPublishReactor. You do not need to
construct this class. This is handed to the OnBeginPublishingSheet method.
</summary>
</member>
<member name="M:AcPublishSheetInfo.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="389">
<summary>
default constructor
</summary>

<remarks>
creates an empty AcPublishSheetInfo. Clients do not
construct this object, it is created by the DMM and handed
to their reactors
</remarks>
</member>
<member name="M:AcPublishSheetInfo.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="400">
<summary>
destructor
</summary>

</member>
<member name="M:AcPublishSheetInfo.GetDSDEntry" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="406">
<summary>
This provides some details about the sheet which is about to
be plotted.
</summary>

<returns>
a const pointer to a DSD Entry object describing the sheet
</returns>
</member>
<member name="M:AcPublishSheetInfo.GetUniqueId" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="416">
<summary>
supplies the unique sheet Id (GUID)
</summary>

<returns>
a const pointer to the GUID string for this sheet
</returns>
</member>
<member name="M:AcPublishSheetInfo.GetPlotLogger" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="425">
<summary>
provides access to the plot logger object
</summary>

<returns>
a pointer to the plot logger used by Publish
</returns>

<remarks>
clients don't need to create or destroy this object
</remarks>
</member>
<member name="T:AcPublishAggregationInfo" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="439">
<summary>
This class is the context information supplied by the OnBeginAggregation 
notifier of AcPublishReactor. You do not need to construct this class. 
This is handed to the OnBeginAggregation method.
</summary>
</member>
<member name="M:AcPublishAggregationInfo.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="450">
<summary>
default constructor
</summary>

<remarks>
creates an empty AcPublishAggregationInfo. Clients do not
construct this object, it is created by the DMM and handed
to their reactors
</remarks>
</member>
<member name="M:AcPublishAggregationInfo.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="461">
<summary>
destructor
</summary>

</member>
<member name="M:AcPublishAggregationInfo.AddGlobalProperties(AcArray&lt;AcDMMEPlotProperty&gt;)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="467">
<summary>
This allows clients to add a list of global properties
to the DWF file's EPlot global section
</summary>

<param name="props">
a vector of AcDMMEPlotProperties
</param>

</member>
<member name="M:AcPublishAggregationInfo.AddGlobalResources(AcArray&lt;AcDMMResourceInfo&gt;)" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="478">
<summary>
This allows clients to add a list of global resources (files)
to the DWF file
</summary>

<param name="resources">
a vector of AcDMMResourceInfo objects which include a mime
type, role and a full path to the resource to be added
</param>

</member>
<member name="M:AcPublishAggregationInfo.GetPlotLogger" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="490">
<summary>
provides access to the plot logger object
</summary>

<returns>
a pointer to the plot logger used by Publish
</returns>

<remarks>
clients don't need to create or destroy this object
</remarks>
</member>
<member name="M:AcPublishAggregationInfo.dwfFileName" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="503">
<summary>
supplies the full path to the final DWF file
</summary>

<returns>
a const pointer to the full path to the final DWF file
</returns>
</member>
<member name="M:AcPublishAggregationInfo.dwfPassword" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="512">
<summary>
supplies the password, if any, needed to open the DWF file
</summary>

<returns>
a const pointer to the password, if any, needed to open the DWF file
</returns>
</member>
<member name="T:AcPublishReactorInfo" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="524">
class AcPublishReactorInfo;
<summary>
This class is the context information supplied by the 
OnAboutToEndPublishing, OnAboutToMoveFile and OnEndPublish notifiers of 
AcPublishRector. You do not need to construct this class. This is handed 
to the OnAboutToEndPublishing, OnAboutToMoveFile and OnEndPublish methods.
</summary>
</member>
<member name="M:AcPublishReactorInfo.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="535">
<summary>
default constructor
clients don't need to construct this class, it is handed
to their reactors
</summary>
</member>
<member name="M:AcPublishReactorInfo.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="542">
<summary>
destructor
</summary>
</member>
<member name="M:AcPublishReactorInfo.dwfFileName" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="547">
<summary>
supplies the full path to the final DWF file
</summary>

<returns>
a const pointer to the full path to the final DWF file
</returns>
</member>
<member name="M:AcPublishReactorInfo.tempDwfFileName" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="556">
<summary>
supplies the full path to the temporary DWF file for this page
</summary>

<returns>
a const pointer to the full path to the temporary DWF file for this 
page
</returns>
</member>
<member name="M:AcPublishReactorInfo.dwfPassword" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="566">
<summary>
supplies the password, if any, needed to open the DWF file
</summary>

<returns>
a const pointer to the password, if any, needed to open the DWF file
</returns>
</member>
<member name="M:AcPublishReactorInfo.isMultiSheetDwf" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="575">
<summary>
is this job being published to multisheet DWF?
</summary>

<returns>
true if this job is being published to multisheet DWF.
</returns>

</member>
<!-- 丢弃成员“T:AcPublishReactor”的格式错误的 XML 文档注释。 -->
<member name="M:AcPublishReactor.OnAboutToBeginBackgroundPublishing(AcPublishBeforeJobInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="672">
<summary>
Brackets the entire plot operation; useful for initialization
and discriminating between various databases
</summary>

<param name="pInfo">
a pointer to an AcPublishBeforeJobInfo object is supplied to
the client reactor, providing context information and methods
</param>

</member>
<member name="M:AcPublishReactor.OnAboutToBeginPublishing(AcPublishBeginJobInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="685">
<summary>
Brackets the entire plot operation; useful for initialization
and discriminating between various databases
</summary>

<param name="pInfo">
a pointer to an AcPublishBeginJobInfo object is supplied to
the client reactor, providing context information and methods
</param>

</member>
<member name="M:AcPublishReactor.OnBeginPublishingSheet(AcPublishSheetInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="697">
<summary>
Brackets the entire plot operation; useful for initialization
and discriminating between various databases
</summary>

<param name="pInfo">
a pointer to an AcPublishBeginSheetInfo object is supplied to
the client reactor, providing context information and methods
</param>

</member>
<member name="M:AcPublishReactor.OnBeginAggregation(AcPublishAggregationInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="709">
<summary>
This notification is sent after all of the temporary DWF files
for the job have been plotted and aggregation into a single
multisheet DWF is about to begin.
</summary>

<param name="pInfo">
a pointer to an AcPublishAggregationInfo object is supplied to
the client reactor, providing context information and methods
</param>

<remarks>
If the job is being published to multiple single page DWF files and
not to multipage DWF, then this notification will be received
once for each page, just before the password is applied.
</remarks>

</member>
<member name="M:AcPublishReactor.OnAboutToEndPublishing(AcPublishReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="729">
<summary>
This notification is sent when the publish job is about to end.
This might be due to cancellation or an error, or it might be
after successful aggregation of a multipage DWF 
</summary>

<param name="pInfo">
a pointer to an AcPublishReactorInfo object is supplied to
the client reactor, providing context information and methods
</param>

<remarks>
If the job is being published to multiple single page DWF files and
not to multipage DWF, it is sent after all if the single page DWF
files have been published.
</remarks>

</member>
<member name="M:AcPublishReactor.OnAboutToMoveFile(AcPublishReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="748">
<summary>
This notification is sent after a multipage DWF has been aggregated
but before the temporary DWF file have been moved to its final
destination.
</summary>

<param name="pInfo">
a pointer to an AcPublishReactorInfo object is supplied to
the client reactor, providing context information and methods
</param>

<remarks>
If the job is being published to multiple single page DWF files and
not to multipage DWF, then this notification will be received
once for each page, just before the single page file is moved to
its final destination.
</remarks>

</member>
<member name="M:AcPublishReactor.OnEndPublish(AcPublishReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="768">
<summary>
This notification is sent at the end of the Publish job
</summary>

<param name="pInfo">
a pointer to an AcPublishReactorInfo object is supplied to
the client reactor, providing context information and methods
</param>

</member>
<member name="M:AcPublishReactor.OnCancelledOrFailedPublishing(AcPublishReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="779">
<summary>
This notification is sent if the job is being cancelled or
aborted due to user input or due to an error
</summary>

<param name="pInfo">
a pointer to an AcPublishReactorInfo object is supplied to
the client reactor, providing context information and methods
</param>

</member>
<member name="M:AcPublishReactor.Dispose" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="791">
<summary>
Public d'tor
</summary>
</member>
<member name="M:AcPublishReactor.#ctor" decl="false" source="c:\objectarx\inc\acpublishreactors.h" line="797">
<summary>
Protected constructor; you must derive to instantiate one
of these.
</summary>
</member>
<member name="M:AcGlobAddPublishReactor(AcPublishReactor*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="837">
<summary>
global function clients should call to add a reactor
</summary>

<param name="pReactor">
a pointer to the reactor the client has derived and instantiated
</param>

</member>
<member name="M:AcGlobRemovePublishReactor(AcPublishReactor*)" decl="true" source="c:\objectarx\inc\acpublishreactors.h" line="847">
<summary>
global function clients should call to remove a reactor
</summary>

<param name="pReactor">
a pointer to the reactor the client has derived and instantiated and
previously added
</param>

</member>
<member name="T:AcPublishUIReactorInfo" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="27">
<summary>
This class is the context information supplied by the 
OnInitPublishOptionsDialog notifier of AcPublishUIReactor. You do not need
to construct this class. This is handed to the 
OnInitPublishOptionsDialog method.
</summary>
</member>
<member name="M:AcPublishUIReactorInfo.#ctor" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="37">
<summary>
default constructor
</summary>

<remarks>
creates an empty AcPublishBeforeJobInfo. Clients do not
construct this object, it is created by the Publishing app
and handed to their reactors
</remarks>
</member>
<member name="M:AcPublishUIReactorInfo.Dispose" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="48">
<summary>
destructor
</summary>

</member>
<member name="M:AcPublishUIReactorInfo.GetDSDData" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="54">
<summary>
read only accesss to the DSD object
</summary>

<returns>
a const pointer to the DSD object for this publish job
</returns>
</member>
<member name="M:AcPublishUIReactorInfo.GetPrivateData(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="63">
<summary>
read/write access to the client's private DSD data
</summary>

<param name="sectionName">
the name the client assigned to its private DSD data section
as a null terminated mbcs string.
</param>

<returns>
returns empty AcNameValuePairVec, if section not found, 
otherwise this returns a const AcNameValuePairVec object with
name value pairs for the section requested.
</returns>
</member>
<member name="M:AcPublishUIReactorInfo.WritePrivateSection(System.Char!System.Runtime.CompilerServices.IsConst*,AcArray&lt;AcNameValuePair&gt;!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="80">
<summary>
replaces a section of the same name
will fail if it attempts to replace a "recognized" section of
standard DSD data
returns true on success, false on error
</summary>

<param name="sectionName">
the name the client assigned to its private DSD data section
as a null terminated mbcs string.
</param>


<param name="nameValuePairVec">
Vector of name and value pairs that clients want to update in their
section in the dsd file
</param>

<returns>
returns true if section data is updated in the dsd data object
successfully, otherwise returns false.
</returns>
</member>
<member name="T:AcPublishUIReactor" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="112">
class AcPublishUIReactor
<summary>
Gives you notification for AcPublish Options UI events
</summary>
</member>
<member name="M:AcPublishUIReactor.OnInitPublishOptionsDialog(IUnknown**,AcPublishUIReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="120">
<summary>
Event Fired just when the Publish Options dialog is about 
to be displayed. Gives users of this reactor to add their
own controls to the property inspector that is passed to 
them via the IUnknown. This allows clients to add UI for
the configuration of their metadata publication options. The
results of this UI can be communicated in the Unrecognized Data section
of the DSD object.
</summary>

<param name="pUnk">
This "out" parameter provides access to the COM API for 
CDWFDataPropertyManager in the Publish Options dialog. This derives 
from IPropertyManager and IPropertyManager2. You can QueryInterface
on it to get the PropertytManager which is documented in dynprops.h
</param>

<param name="pInfo">
a pointer to an AcPublishUIReactorInfo object is supplied to
the client reactor, providing context information and methods
to set or get their private section data
</param>

</member>
<member name="M:AcPublishUIReactor.OnInitExportOptionsDialog(IUnknown**,AcPublishUIReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="146">
<summary>
Event Fired just when the Export to DWF/PDF Publish Options dialog 
is about to be displayed. Gives users of this reactor to add their
own controls to the property inspector that is passed to 
them via the IUnknown. This allows clients to add UI for
the configuration of their metadata publication options. The
results of this UI can be communicated in the registry of KEY
@ HKEY_CURRENT_USER\...\Dialogs\AcQuickPublishOpts
</summary>

<param name="pUnk">
This "out" parameter provides access to the COM API for 
CDWFDataPropertyManager in the Publish Options dialog. This derives 
from IPropertyManager and IPropertyManager2. You can QueryInterface
on it to get the PropertytManager which is documented in dynprops.h
</param>

<param name="pInfo">
a pointer to an AcPublishUIReactorInfo object is supplied to
the client reactor, providing context information and methods
to set or get their private section data
The parameter is reserved for the future, now it is not used.
</param>

</member>
<member name="M:AcPublishUIReactor.PersistenceRegistryForExportOptionsDialog(System.Char!System.Runtime.CompilerServices.IsConst*,System.Boolean)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="174">
<summary>
Envent Fired just when Read/Save options from/to Registry 
@ HKEY_CURRENT_USER\...\Dialogs\AcQuickPublishOpts
</summary>
<returns>
</returns>
<param name="lpszRegRoot">
This parameter is the root path of KEY @ Software\...\Dialogs\AcQuickPublishOpts
</param>
<param name="bIsReadRegistry">
true, read options data from registry
false, save options data to registy
</param>
</member>
<member name="M:AcPublishUIReactor.OnInitAutoPublishSettingsDialog(IUnknown**,AcPublishUIReactorInfo*)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="190">
<summary>
Event Fired just when the Auto Publish Settings dialog is about 
to be displayed. Gives users of this reactor to add their
own controls to the property inspector that is passed to 
them via the IUnknown. This allows clients to add UI for
the configuration of their metadata publication options. The
results of this UI can be communicated in the registry of KEY 
@ HKEY_CURRENT_USER\...\Dialogs\AcAutoPublishOpts
</summary>

<param name="pUnk">
This "out" parameter provides access to the COM API for 
CDWFDataPropertyManager in the Publish Options dialog. This derives 
from IPropertyManager and IPropertyManager2. You can QueryInterface
on it to get the PropertytManager which is documented in dynprops.h
</param>

<param name="pInfo">
a pointer to an AcPublishUIReactorInfo object is supplied to
the client reactor, providing context information and methods
to set or get their private section data
The parameter is reserved for the future, now it is not used.
</param>

</member>
<member name="M:AcPublishUIReactor.PersistenceRegistryForAutoPublishDialog(System.Char!System.Runtime.CompilerServices.IsConst*,System.Boolean)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="218">
<summary>
Envent Fired just when Read/Save options from/to Registry 
@ HKEY_CURRENT_USER\...\Dialogs\AcAutoPublishOpts
</summary>
<returns>
</returns>
<param name="lpszRegRoot">
This parameter is the root path of KEY @ Software\...\Dialogs\AcAutoPublishOpts
</param>
<param name="bIsReadRegistry">
true, read options data from registry
false, save options data to registy
</param>
</member>
<member name="M:AcPublishUIReactor.Dispose" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="234">
<summary>
Public d'tor
</summary>
</member>
<member name="M:AcPublishUIReactor.#ctor" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="240">
<summary>
Protected constructor; you must derive to instantiate one
of these.
</summary>
</member>
<member name="T:AcPublishUIReactor2" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="283">
class AcPublishUIReactor2
<summary>
AcPublishUIReactor2 is used to extend the implementation of AcPublishUIReactor
while maintaining binary compatibility.
AcPublishUIReactor expose PersistenceRegistryForPubishOptionsDialog method to 
read/save options for AcPublishDlg
</summary>
</member>
<!-- 丢弃成员“M:AcPublishUIReactor2.PersistenceRegistryForPubishOptionsDialog(System.Char!System.Runtime.CompilerServices.IsConst*,System.Boolean)”的格式错误的 XML 文档注释。 -->
<member name="M:AcPublishUIReactor2.Dispose" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="310">
<summary>
Public d'tor
</summary>
</member>
<member name="M:AcPublishUIReactor2.#ctor" decl="false" source="c:\objectarx\inc\acpublishuireactors.h" line="316">
<summary>
Protected constructor; you must derive to instantiate one
of these.
</summary>
</member>
<member name="M:AcGlobAddPublishUIReactor(AcPublishUIReactor*)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="327">
<summary>
global function clients should call to add a reactor
</summary>

<param name="pReactor">
a pointer to the reactor the client has derived and instantiated
</param>

</member>
<member name="M:AcGlobRemovePublishUIReactor(AcPublishUIReactor*)" decl="true" source="c:\objectarx\inc\acpublishuireactors.h" line="337">
<summary>
global function clients should call to remove a reactor
</summary>

<param name="pReactor">
a pointer to the reactor the client has derived and instantiated and
previously added
</param>

</member>
<member name="T:AcDMMEPlotProperties" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="13">
<summary>
this is the plot-time part of the Dwf Metadata Manager API
These notifications are sent only during the plot time portion of
a Publish to DWF operation. Additional notifications are sent from
the Publish code, before and after the plot time notifications

classes defined here include:
AcDMMSheetReactorInfo
AcDMMEntityReactorInfo
AcDMMReactor
</summary>
<summary>
This file describes the following objects
AcDMMWideString - a simple Unicode string class
AcDMMStringVec - a vector of AcDMMWideStrings
AcDMMNode - which encapsulates a w2d Node
AcDMMResourceInfo - which contains the description of one resource
AcDMMResourceVec - a vector of AcDMMResourceInfo objects
(file) to the added to the DWF page or to the ePlot global section
</summary>
<summary>
This class is a lighweight proxy for the DWF EPlotProperties class which is
used by the DMM (DWF Metadata Manager) API to allow clients to
associate entity properties with DWF geometry without linking to
the DWF toolkit. This class contains the data but not the behavior
of the corresponding DWF toolkit object. 
</summary>

<remarks>
Note that all strings are Unicode. XML encoding will be done by the
DMM when the proxy object is converted to the corresponding DWF
toolkit object.
</remarks>

</member>
<member name="M:AcDMMEPlotProperties.#ctor" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="43">
<summary>
Default constructor
</summary>

<remarks>
Constructs an empty AcDMMEPlotProperties object.
</remarks>

</member>
<member name="M:AcDMMEPlotProperties.#ctor(AcDMMEPlotProperties!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="57">
<summary>
Copy constructor
</summary>

<param name="src">
the object to be copied
</param>

</member>
<member name="M:AcDMMEPlotProperties.Dispose" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="71">
<summary>
Destructor
</summary>

</member>
<member name="M:AcDMMEPlotProperties.AddProperty(AcDMMEPlotProperty!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="84">
<summary>
Adds a new AcDMMEPlotProperty object to the internal vector of 
properties
</summary>

<param name="property">
the property to be added to this Properties list
</param>

</member>
<member name="M:AcDMMEPlotProperties.AddProperty(System.Char*,System.Char*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="100">
<summary>
Creates and adds a new AcDMMEPlotProperty object to the internal 
vector of properties.
</summary>

<param name="name">
the new property's name
</param>

<param name="value">
the new property's value
</param>

</member>
<member name="M:AcDMMEPlotProperties.GetProperties" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="119">
<summary>
accessor for the internal vector of AcDMMEPlotProperty objects
contained by this object
</summary>

<returns>
Returns a const reference to the internal Vector of 
AcDMMEPlotProperty objects contained by this object
</returns>
</member>
<member name="M:AcDMMEPlotProperties.GetProperty(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="133">
<summary>
accessor for individual properties in the internal vector of
AcDMMEPlotProperties contained in this object
</summary>

<param name="index">
the zero based index of the desired property
</param>

<returns>
Returns a const pointer to the EPlotProperty object at the given 
0-based index.
</returns>

<remarks>
warning - May overflow the internal Vector array.  Clients should 
check GetProperties().size() before calling this method.
</remarks>

</member>
<member name="M:AcDMMEPlotProperties.SetId(System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="160">
<summary>
mutator for the Id attribute of this object
</summary>

<param name="id">
the Unicode unique identifier the client assigns to this object.
</param>

<remarks>
The unique identifier for this EPlotProperties element (can be 
a name, a GUID, etc.). It is preferred for this string to be
prefixed with the client application name to distinguish its
properties from those of other clients
The EPlotProperties element, when used in an ObjectDefinition resource,
can be referenced by other "child" EPlotProperties elements, thereby 
creating an efficient hierarchy of properties.
WARNING - these Ids are processed in a space delimited list. Your
properties will not behave as expected if the Id contains spaces.
</remarks>
</member>
<member name="M:AcDMMEPlotProperties.GetId" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="192">
<summary>
accessor for the Id attribute.
</summary>

<returns>
returns a const pointer to the Unicode string which is the unique
identifier assigned by the client to this object.
</returns>

<remarks>
Returns the unique identifier for this AcDMMEPlotProperties element.
</remarks> 
</member>
<member name="M:AcDMMEPlotProperties.SetRefs(AcArray&lt;AcDMMWideString&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="209">
<summary>
Sets the vector of the unique identifiers of the EPlotProperties 
objects referenced (inherited) by this object.
</summary>

<param name="refs">
a const reference to a vector of Unicode string identifications
of additional AcDMMEPlotProperties objects
</param>

<remarks>
The properties in the referenced EPlotProperties objects should be 
considered part of this EPlotProperties instance as if they were 
contained directly by this instance.
</remarks>
</member>
<member name="M:AcDMMEPlotProperties.GetRefs" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="231">
<summary>
accessor for the vector of Unicode string identifications of 
referenced AcDMMEPlotProperties objects
</summary>

<returns>
a const pointer to the vector of Unicode string identifications of 
referenced AcDMMEPlotProperties objects
</returns>
</member>
<member name="M:AcDMMEPlotProperties.op_Assign(AcDMMEPlotProperties!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmeplotproperties.h" line="246">
<summary>
operator= also used by copy constructor
</summary>

<param name="src">
the object whose values will be copied to this object
</param>

<returns>
returns this object
</returns>
</member>
<member name="T:Ac3dDwfNavTreeNode" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="15">
<summary>
This file describes the following objects
AcDMMWideString - a simple Unicode string class
AcDMMStringVec - a vector of AcDMMWideStrings
AcDMMNode - which encapsulates a w2d Node
AcDMMResourceInfo - which contains the description of one resource
AcDMMResourceVec - a vector of AcDMMResourceInfo objects
(file) to the added to the DWF page or to the ePlot global section
</summary>
<summary>
This class describes the interface that must be implemented by the 
(optional) NavTree Publisher. The NavTree publisher controls what will 
appear in the navigation tree in the Viewer.
If no NavTree publisher is passed in to the Ac3dDwfPublisher, then it
will display a "flat" tree listing all the objects with their class names
and handles.

You must create an object that implements the Ac3dDwfNavTreePublisher interface,
i.e. an object that derives from Ac3dDwfNavTreePublisher and implements its functions.
You will get called after each entity is done publishing its graphics and properties.
Use those calls to build a tree of Ac3dDwfNavTreeNode's, based on the data
in the Ac3dDwfEntityHeader. That data includes the "Graphics keys" which are
used in the DWF to identify the graphics associated with the entity.
When all other publishing is done, the Ac3dDwfPublisher will ask you for that
tree by asking for its root node: Ac3dDwfNavTreeNode* root();

</summary>
</member>
<member name="M:Ac3dDwfNavTreeNode.displayName" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="36">
<summary>
This method is called to get the display name of the tree node
</summary>

<returns>
returns the name of the tree node.
</returns>
</member>
<member name="M:Ac3dDwfNavTreeNode.keys" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="45">
<summary>
This method is called to get the graphic identifiers for this tree 
node
</summary>

<returns>
returns the graphic identifiers for this tree node
</returns>
</member>
<member name="M:Ac3dDwfNavTreeNode.nDescendants" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="55">
<summary>
This method is called to get the number of descendants for this
tree node. Number of descendants includes children, grandchildren
and so on recursively.
</summary>

<returns>
returns the number of descendants in the tree node.
</returns>
</member>
<member name="M:Ac3dDwfNavTreeNode.isGroup" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="66">
<summary>
This method is called to get the flag to see if this node should
be displayed as a group or not. The default implementation appends
the number of descendants to the display name
</summary>

<returns>
returns true if tree node is a group.
</returns>
</member>
<member name="M:Ac3dDwfNavTreeNode.children" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="77">
<summary>
This method is called to get an array of all the tree node children
of this tree node.
</summary>

<returns>
returns a array of all the children of this tree node.
</returns>
</member>
<member name="M:Ac3dDwfNavTreeNode.isBlock" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="87">
<summary>
This method is called to get the flag to see if node is grouped
by block. If this is true, all the descendants graphics will be grouped
together into this tree node, which will have no descendants.
</summary>

<returns>
returns true if node is grouped by block.
</returns>
</member>
<member name="M:Ac3dDwfNavTreeNode.addChild(Ac3dDwfNavTreeNode!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="97">
<summary>
Call this method to add a child to the root node. When trying to
register the Ac3dDwfNavTreeNode root in the AcDMMSheetReactorInfo, only
the first client wins. In order for other clients who are registered 
after the first client, to add or remove children, Clients can choose
to implement addChild and removeChild methods.
</summary>

<param name="root">
a pointer to an Ac3dDwfNavTreeNode object that the clients wants
to add to the navigation tree.
</param>

<returns>
returns true if successfully adds the Ac3dDwfNavTreeNode node as child
to the root node
</returns>

</member>
<member name="M:Ac3dDwfNavTreeNode.removeChild(Ac3dDwfNavTreeNode!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\ac3ddwfnavtree.h" line="116">
<summary>
Call this method to remoave a child from the root node. When trying to
register the Ac3dDwfNavTreeNode root in the AcDMMSheetReactorInfo, only
the first client wins. In order for other clients who are registered 
after the first client, to add or remove children, Clients can choose
to implement addChild and removeChild methods.
</summary>

<param name="root">
a pointer to an Ac3dDwfNavTreeNode object that the clients wants
to remove from the navigation tree
</param>

<returns>
returns true if successfully removes the Ac3dDwfNavTreeNode node from
the navigation tree
</returns>

</member>
<member name="T:AcDMMSheetReactorInfo" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="41">
<summary>
This class is the context information supplied by the OnBeginSheet
and OnEndSheet notifiers of AcDMMReactor
You do not need to construct this class.
This is handed to the OnBeginSheet and OnEndSheet methods
</summary>
</member>
<member name="T:AcDMMSheetReactorInfo.PlotArea" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="54">
<summary>
describes the plot area (what to plot) requested
</summary>
</member>
<member name="F:kDisplay" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="58">
<summary>
plot display, the visible portion of the picture
</summary>
</member>
<member name="F:kExtents" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="62">
<summary>
plot extents, i.e. all geometry
</summary>
</member>
<member name="F:kLimits" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="66">
<summary>
plot the limits set by the user
</summary>
</member>
<member name="F:kView" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="70">
<summary>
plot a named view
</summary>
</member>
<member name="F:kWindow" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="74">
<summary>
plot a user specified window - a rectangular area
</summary>
</member>
<member name="F:kLayout" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="78">
<summary>
plot the extents of the layout
</summary>
</member>
<member name="T:AcDMMSheetReactorInfo.PlotRotation" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="84">
<summary>
how much camera rotation is applied for this plot
</summary>
</member>
<member name="F:k0degrees" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="88">
<summary>
0 degrees camera rotation
</summary>
</member>
<member name="F:k90degrees" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="92">
<summary>
90 degrees camera rotation
</summary>
</member>
<member name="F:k180degrees" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="96">
<summary>
180 degrees camera rotation, i.e., plot upside down
</summary>
</member>
<member name="F:k270degrees" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="100">
<summary>
270 degrees camera rotation
</summary>
</member>
<member name="T:AcDMMSheetReactorInfo.PlotMediaUnits" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="106">
<summary>
the configured media units. This will always be dimensional
for DWF plots.
</summary>
</member>
<member name="F:kInches" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="111">
<summary>
using imperial units
</summary>
</member>
<member name="F:kMillimeters" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="115">
<summary>
 using metric units
</summary>
</member>
<member name="F:kPixels" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="119">
<summary>
using dimensionaless raster units, not expected for DWF
</summary>
</member>
<member name="M:AcDMMSheetReactorInfo.GetPlotLogger" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="125">
<summary>
provides access to the plotLogger object
</summary>

<returns>
a pointer to an AcPlPlotLogger service
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.database" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="135">
<summary>
accessor for the database being plotted
</summary>
   
<returns>
a pointer to the database being plotted
</returns>
</member>
<member name="M:AcDMMSheetReactorInfo.isPlotJobCancelled" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="144">
<summary>
query the current plot status
</summary> 
<returns>
true if the job has been cancelled or aborted
</returns>

<remarks>
most useful in OnEndSheet callbacks
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.AddPageProperties(AcArray&lt;AcDMMEPlotProperty&gt;)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="156">
<summary>
This allows clients to add a list of properties 
to the DWF file, to be associated with this page but not
associated with any particular entity. These will be added
to the page descriptor.
</summary>

<param name="props">
a vector of AcDMMEPlotProperties
</param>

</member>
<member name="M:AcDMMSheetReactorInfo.AddPageResources(AcArray&lt;AcDMMResourceInfo&gt;)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="169">
<summary>
This allows clients to add a list of resources (files)
to the DWF file, to be associated with this page but not
associated with any particular entity. 
</summary>

<param name="resources">
a vector of AcDMMResourceInfo objects which include a mime 
type, role and a full path to the resource to be added
</param>

</member>
<member name="M:AcDMMSheetReactorInfo.UniqueLayoutId" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="184">
<summary>
accessor for this sheet's unique identifier
</summary>

<returns>
this returns a const pointer to the GUID assigned the first time this 
layout was published (it gets reused on republish)
</returns>
</member>
<member name="M:AcDMMSheetReactorInfo.plotLayoutId" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="194">
<summary>
accessor for this layout's object ID
</summary>
<returns>
AcDbLayout object ID
</returns>
</member>
<member name="M:AcDMMSheetReactorInfo.isModelLayout" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="202">
<summary>
is this the Model tab or a layout?
</summary>

<returns>
true if this is the Model tab
</returns>
</member>
<member name="M:AcDMMSheetReactorInfo.plotArea" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="212">
<summary>
accessor for the configured plot area (what to plot)
</summary>

<returns>
a PlotArea enum
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.plotRotation" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="222">
<summary>
accessor for the configured plot rotation (camera rotation)
</summary>

<returns>
a PlotRotation enum
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.plotMediaUnits" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="232">
<summary>
accessor for the configured plot media units
</summary>

<returns>
a PlotMediaUnits enum
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.paperScale" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="242">
<summary>
accessor for the configured paper scale. Divided by the
drawing scale, this gives the plot scale in use
</summary>

<returns>
the paper scale as a double precision number
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.drawingScale" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="253">
<summary>
accessor for the configured drawing scale aka model scale
</summary>

<returns>
the drawing scale as a double precision number
</returns>

<remarks>
this is useful when considered together with the paper scale
the plot scale is "paper scale" : "drawing scale"
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.originX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="267">
<summary>
accessor for the x coordinate of the plot origin, in media units, 
from the corner of the paper.
</summary>

<returns>
the x coordinate of the plot origin, in media units, 
from the corner of the paper. 
</returns>

<seealso cref="M:AcDMMSheetReactorInfo.plotMediaUnits"/>
<seealso cref="M:AcDMMSheetReactorInfo.originY"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetX"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetY"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetXdevice"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetYdevice"/>

</member>
<member name="M:AcDMMSheetReactorInfo.originY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="286">
<summary>
accessor for the y coordinate of the plot origin, in media units, 
from the corner of the paper.
</summary>

<returns>
the y coordinate of the plot origin, in media units, 
from the corner of the paper. 
</returns>

<seealso cref="M:AcDMMSheetReactorInfo.plotMediaUnits"/>
<seealso cref="M:AcDMMSheetReactorInfo.originX"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetX"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetY"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetXdevice"/>
<seealso cref="M:AcDMMSheetReactorInfo.effectivePlotOffsetYdevice"/>

</member>
<member name="M:AcDMMSheetReactorInfo.plotWindowMinX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="305">
<summary>
accessor for x coordinate of the lower left corner of the plot window
</summary>

<returns>
x coordinate of the lower left corner of the plot window in world
(model) coordinates
</returns>

<remarks>
meaningful if plotArea() == kWindow; world coordinates
</remarks>

<seealso cref="M:AcDMMSheetReactorInfo.plotArea"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMinY"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMaxX"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMaxY"/>

</member>
<member name="M:AcDMMSheetReactorInfo.plotWindowMinY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="325">
<summary>
accessor for y coordinate of the lower left corner of the plot window
</summary>

<returns>
y coordinate of the lower left corner of the plot window in world
(model) coordinates
</returns>

<remarks>
meaningful if plotArea() == kWindow; world coordinates
</remarks>

<seealso cref="M:AcDMMSheetReactorInfo.plotArea"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMinX"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMaxX"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMaxY"/>

</member>
<member name="M:AcDMMSheetReactorInfo.plotWindowMaxX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="345">
<summary>
accessor for x coordinate of the upper right corner of the plot window
</summary>

<returns>
x coordinate of the upper right corner of the plot window in world
(model) coordinates
</returns>

<remarks>
meaningful if plotArea() == kWindow; world coordinates
</remarks>

<seealso cref="M:AcDMMSheetReactorInfo.plotArea"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMinX"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMinY"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMaxY"/>

</member>
<member name="M:AcDMMSheetReactorInfo.plotWindowMaxY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="365">
<summary>
accessor for y coordinate of the upper right corner of the plot window
</summary>

<returns>
y coordinate of the upper right corner of the plot window in world
(model) coordinates
</returns>

<remarks>
meaningful if plotArea() == kWindow; world coordinates
</remarks>

<seealso cref="M:AcDMMSheetReactorInfo.plotArea"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMinX"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMinY"/>
<seealso cref="M:AcDMMSheetReactorInfo.plotWindowMaxX"/>

</member>
<member name="M:AcDMMSheetReactorInfo.viewPlotted" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="386">
<summary>
accessor for the name of the view bring plotted
</summary>

<returns>
a null terminated string containing the view name
</returns>

<remarks>
meaningful if plotArea() == kView; world coordinates
</remarks>

<seealso cref="M:AcDMMSheetReactorInfo.plotArea"/>

</member>
<member name="M:AcDMMSheetReactorInfo.isScaleSpecified" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="402">
<summary>
is a plot scale specified or is it scale "to fit"
</summary>

<returns>
true if a plot scale was specified
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.areLinesHidden" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="412">
<summary>
is hidden line removal configured?
</summary>

<returns>
true if this plot is done with hidden line removal
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.arePlottingLineWeights" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="422">
<summary>
are lineweights being plotted?
</summary>

<returns>
true if lineweights are configured to be plotted
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.areScalingLineWeights" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="432">
<summary>
are lineweights being scaled?
</summary>

<returns>
true if lineweights are being scaled
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.displayMinX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="444">
<summary>
accessor for x coordinate of the lower left corner of the display
</summary>

<returns>
x coordinate of the lower left corner of the display window
in world coordinates
</returns>

<seealso cref="!:AcDMMSheetReactorInfo.displayMinY"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMaxX"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMaxY"/>

</member>
<member name="M:AcDMMSheetReactorInfo.displayMinY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="459">
<summary>
accessor for y coordinate of the lower left corner of the display
</summary>

<returns>
y coordinate of the lower left corner of the display window
in world coordinates
</returns>

<seealso cref="!:AcDMMSheetReactorInfo.displayMinX"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMaxX"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMaxY"/>

</member>
<member name="M:AcDMMSheetReactorInfo.displayMaxX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="474">
<summary>
accessor for x coordinate of the upper right corner of the display
</summary>

<returns>
x coordinate of the upper right corner of the display window
in world coordinates
</returns>

<seealso cref="!:AcDMMSheetReactorInfo.displayMinX"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMinY"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMaxY"/>

</member>
<member name="M:AcDMMSheetReactorInfo.displayMaxY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="489">
<summary>
accessor for y coordinate of the upper right corner of the display
</summary>

<returns>
y coordinate of the upper right corner of the display window
in world coordinates
</returns>

<seealso cref="!:AcDMMSheetReactorInfo.displayMinX"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMinY"/>
<seealso cref="!:AcDMMSheetReactorInfo.displayMaxX"/>

</member>
<member name="M:AcDMMSheetReactorInfo.layoutMarginMinX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="507">
<summary>
accessor for distance from the left edge of the paper to the
left edge of the printable area
</summary>

<returns>
distance from the left edge of the paper to the left edge of the 
printable area, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.layoutMarginMinY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="519">
<summary>
accessor for distance from the bottom edge of the paper to the
bottom edge of the printable area
</summary>

<returns>
distance from the bottom edge of the paper to the bottom edge of the 
printable area, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.layoutMarginMaxX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="531">
<summary>
accessor for distance from the right edge of the paper to the
right edge of the printable area
</summary>

<returns>
distance from the right edge of the paper to the right edge of the 
printable area, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.layoutMarginMaxY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="543">
<summary>
accessor for distance from the top edge of the paper to the
top edge of the printable area
</summary>

<returns>
distance from the top edge of the paper to the top edge of the 
printable area, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.printableBoundsX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="557">
<summary>
accessor for the width of the printable area
</summary>

<returns>
the width of the printable area, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.printableBoundsY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="567">
<summary>
accessor for the height of the printable area
</summary>

<returns>
the height of the printable area, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.maxBoundsX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="577">
<summary>
accessor for the width of the configured media
</summary>

<returns>
the width of the configured media, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.maxBoundsY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="587">
<summary>
accessor for the height of the configured media
</summary>

<returns>
the height of the configured media, in the configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.stepsPerInch" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="597">
<summary>
accessor for the configured vector resolution in dots per inch
</summary>

<returns>
the configured vector resolution
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.configuration" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="607">
<summary>
accessor for the configured device name (pc3 file or device name)
</summary>

<returns>
the configured plotter name (pc3 file or device name)
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.plotToFilePath" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="617">
<summary>
accessor for the plot to file path (directory)
</summary>

<returns>
the plot to file path
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.plotToFileName" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="627">
<summary>
accessor for the plot to file filename
</summary>

<returns>
the plot to file filename
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.canonicalMediaName" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="637">
<summary>
accessor for the canonical name of the configured media size
</summary>

<returns>
the canonical name of the configured media size
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.plotBoundsMinX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="648">
<summary>
accessor for x coordinate of the lower left corner of the plot bounds
</summary>

<returns>
x coordinate of the lower left corner of the plot bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) being plotted, regardless of plotArea()
(Note: this is what is requested to be plotted; some clipping may occur
depending on media size and rotation.)
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.plotBoundsMinY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="664">
<summary>
accessor for y coordinate of the lower left corner of the plot bounds
</summary>

<returns>
y coordinate of the lower left corner of the plot bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) being plotted, regardless of plotArea()
(Note: this is what is requested to be plotted; some clipping may occur
depending on media size and rotation.)
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.plotBoundsMaxX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="680">
<summary>
accessor for x coordinate of the upper right corner of the plot bounds
</summary>

<returns>
x coordinate of the upper right corner of the plot bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) being plotted, regardless of plotArea()
(Note: this is what is requested to be plotted; some clipping may occur
depending on media size and rotation.)
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.plotBoundsMaxY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="696">
<summary>
accessor for y coordinate of the upper right corner of the plot bounds
</summary>

<returns>
y coordinate of the upper right corner of the plot bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) being plotted, regardless of plotArea()
(Note: this is what is requested to be plotted; some clipping may occur
depending on media size and rotation.)
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.layoutBoundsMinX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="712">
<summary>
accessor for x coordinate of the lower left corner of the printable
bounds
</summary>

<returns>
x coordinate of the lower left corner of the layout (printable) bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) of the printable bounds of the medium 
being plotted to. This may be larger or smaller than plotBounds...() 
above, depending on what is being plotted, and the scale being used.
For example, AutoCAD paperspace always plots to these bounds,
trying to fit plotBounds into this rectangle (but not
clipping to that rectangle.)  AutoCAD modelspace actually 
plots the intersection of this rectangle (what *would* fit onto 
the paper at the specified scale and offset) and plotBounds
(what the user requested to plot.)  In this case, the
plot is clipped.
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.layoutBoundsMinY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="736">
<summary>
accessor for y coordinate of the lower left corner of the printable
bounds
</summary>

<returns>
y coordinate of the lower left corner of the layout (printable) bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) of the printable bounds of the medium 
being plotted to. This may be larger or smaller than plotBounds...() 
above, depending on what is being plotted, and the scale being used.
For example, AutoCAD paperspace always plots to these bounds,
trying to fit plotBounds into this rectangle (but not
clipping to that rectangle.)  AutoCAD modelspace actually 
plots the intersection of this rectangle (what *would* fit onto 
the paper at the specified scale and offset) and plotBounds
(what the user requested to plot.)  In this case, the
plot is clipped.
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.layoutBoundsMaxX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="760">
<summary>
accessor for x coordinate of the upper right corner of the printable
bounds
</summary>

<returns>
x coordinate of the upper right corner of the layout (printable) bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) of the printable bounds of the medium 
being plotted to. This may be larger or smaller than plotBounds...() 
above, depending on what is being plotted, and the scale being used.
For example, AutoCAD paperspace always plots to these bounds,
trying to fit plotBounds into this rectangle (but not
clipping to that rectangle.)  AutoCAD modelspace actually 
plots the intersection of this rectangle (what *would* fit onto 
the paper at the specified scale and offset) and plotBounds
(what the user requested to plot.)  In this case, the
plot is clipped.
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.layoutBoundsMaxY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="784">
<summary>
accessor for y coordinate of the upper right corner of the printable
bounds
</summary>

<returns>
y coordinate of the upper right corner of the layout (printable) bounds
in world coordinates
</returns>

<remarks>
the rectangle (in world coords) of the printable bounds of the medium 
being plotted to. This may be larger or smaller than plotBounds...() 
above, depending on what is being plotted, and the scale being used.
For example, AutoCAD paperspace always plots to these bounds,
trying to fit plotBounds into this rectangle (but not
clipping to that rectangle.)  AutoCAD modelspace actually 
plots the intersection of this rectangle (what *would* fit onto 
the paper at the specified scale and offset) and plotBounds
(what the user requested to plot.)  In this case, the
plot is clipped.
</remarks>
</member>
<member name="M:AcDMMSheetReactorInfo.effectivePlotOffsetX" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="811">
<summary>
accessor for x coordinate of the effective plot origin
in media units
</summary>

<returns>
x coordinate of the x coordinate of the effective plot origin
in configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.effectivePlotOffsetY" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="823">
<summary>
accessor for y coordinate of the effective plot origin
in media units
</summary>

<returns>
y coordinate of the x coordinate of the effective plot origin
in configured media units
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.effectivePlotOffsetXdevice" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="835">
<summary>
accessor for x coordinate of the effective plot origin
in device coordinates (pixels)
</summary>

<returns>
x coordinate of the x coordinate of the effective plot origin
in device coordinates (pixels)
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.effectivePlotOffsetYdevice" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="847">
<summary>
accessor for y coordinate of the effective plot origin
in device coordinates (pixels)
</summary>

<returns>
y coordinate of the x coordinate of the effective plot origin
in device coordinates (pixels)
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.publishingTo3DDwf" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="859">
<summary>
Are we publishing a 3D DWF?
</summary>

<returns>
returns true if the sheet is being published to a 3D DWF
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.set3dDwfNavigationTreeNode(Ac3dDwfNavTreeNode!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="869">
<summary>
Call this method to register the root of your Ac3DDwfNavTreeNode 
during the Begin Sheet reactor call. Note the first client who 
registers their root node wins. Root node that is set is used only
at the end of End Sheet reactor call to publish the navigation tree.
So it is OK to set a root node that is empty at the beginning of 
Begin Sheet reactor call. 
Since only the first client who register their nav tree root node wins,
if the clients implements addChild and removeChild on Ac3dDwfNavTreeNode
interface, other clients can get a chance to modify the navigation tree
using addChild and removeChild
</summary>

<param name="root">
a pointer to an Ac3dDwfNavTreeNode object that the clients wants
to register.
</param>

<returns>
returns true if successfully registers the Ac3dDwfNavTreeNode 
passed in
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.get3dDwfNavigationTreeNode" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="894">
<summary>
Call this method to get the current Ac3DDwfNavTreeNode root node. If 
there is no root node registered, a NULL pointer is returned. If a root
node is already registered, you can still modify the navigation tree,
provided the client who registered the root node implements the addChild
and removeChild methods.
</summary>

<returns>
returns a pointer to the current Ac3dDwfNavTreeNode root node. If there is
no root node registered, a NULL pointer is returned.
</returns>

</member>
<member name="M:AcDMMSheetReactorInfo.Dispose" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="910">
<summary>
destructor
</summary>
</member>
<member name="M:AcDMMSheetReactorInfo.#ctor" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="916">
<summary>
constructor - you don't construct this class. It is handed to you
as context information in the reactor
</summary>
</member>
<member name="T:AcDMMEntityReactorInfo" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="928">
<summary>
This class is the context information supplied by the OnBeginEntity
and OnEndEntity notifiers of AcDMMReactor
You do not need to construct this class.
This is handed to the OnBeginEntity and OnEndEntity methods
</summary>
</member>
<member name="M:AcDMMEntityReactorInfo.isCancelled" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="939">
<summary>
query the current plot status
</summary> 
<returns>
true if cancelled or aborted
</returns>

<remarks>
in case you'd like to know if the plot is being cancelled
</remarks>
</member>
<member name="M:AcDMMEntityReactorInfo.UniqueEntityId" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="951">
<summary>
compute a unique entity id string
</summary>

<returns>
dwg GUID + ASCII handles in xref path + object ASCII handle
</returns>

<remarks>
This is handy for use as a unique Properties Id.
</remarks>
</member>
<member name="M:AcDMMEntityReactorInfo.entity" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="965">
<summary>
accessor for the current entity 
</summary>

<returns>
a pointer to the AcDbEntity
</returns>

<remarks>
You'll use this to identify the entities of interest to you.
</remarks>
</member>
<member name="M:AcDMMEntityReactorInfo.effectiveBlockLayerId" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="979">
<summary>
compute the effective layer ID
</summary>

<returns>
the AcDbObjectId of the effective layer
</returns>

<remarks>
useful for objects on Layer 0
</remarks>
</member>
<member name="M:AcDMMEntityReactorInfo.GetCurrentEntityNode(AcDMMNode*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AcArray&lt;AcDbObjectId&gt;)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="992">
<summary>
determine if this entity has already been assigned a Node
</summary>

<param name="node">
an "out" parameter, a reference to the entity's node, if any
</param>

<param name="objIds">
an additional AcDbObjectIdArray of objIds that should be empty if this
entity is not part of a block, and should be array of objects ids of 
each block that enclose this instance of the entity if it is part of
a block. This is necessary to disambiguate multiple block insertions. 
Most clients of the API will supply empty array here.
</param>

<returns>
true if this entity has already been assigned a node
false if no node has been assigned
</returns>

</member>
<member name="M:AcDMMEntityReactorInfo.GetNextAvailableNodeId" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1015">
<summary>
fetch the next unused node number
</summary>

<returns>
the next unused integer node number
</returns>

<remarks>
client may assign Node name to this Node, it will initially have
an empty string as its name. (Node name is optional.)
</remarks>

</member>
<member name="M:AcDMMEntityReactorInfo.GetEntityNode(AcDbObjectId,AcArray&lt;AcDbObjectId&gt;,System.Int32*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1030">
<summary>
look up any entity ID in the map of Id to node, find out if a Node
has already been assigned to a particular entity.
</summary>

<param name="id">
the AcDbObjectId to look up
</param>

<param name="objIds">
an additional AcDbObjectIdArray of objIds that should be empty if this
entity is not part of a block, and should be array of objects ids of 
each block that enclose this instance of the entity if it is part of
a block. This is necessary to disambiguate multiple block insertions. 
Most clients of the API will supply empty array here.
</param>

<param name="nodeId">
"out" parameter, the NodeId for this entity, if one has already
been assigned.
</param>

<returns>
returns true if this entity has already been assigned a NodeId
</returns>
</member>
<member name="M:AcDMMEntityReactorInfo.GetNode(System.Int32)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1058">
<summary>
finds a Node given its Id
</summary>

<param name="nodeId">
the integer id of the Node to search for, should be &gt; 0
</param>

<returns>
NULL if node not found, otherwise returns a const pointer to the Node.
</returns>

</member>
<member name="M:AcDMMEntityReactorInfo.GetPlotLogger" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1073">
<summary>
provides access to the plotLogger object
</summary>

<returns>
a pointer to an AcPlPlotLogger service
</returns>

</member>
<member name="M:AcDMMEntityReactorInfo.SetCurrentNode(System.Int32,AcArray&lt;AcDbObjectId&gt;)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1085">
<summary>
Determines which Node will be assigned to the current entity.
This calls AddNodeToMaps or MapEntityToNode internally.
</summary>

<param name="nodeId">
the NodeId to assign, should be &gt; 0
</param>

<param name="objIds">
an additional AcDbObjectIdArray of objIds that should be empty if this
entity is not part of a block, and should be array of objects ids of 
each block that enclose this instance of the entity if it is part of
a block. This is necessary to disambiguate multiple block insertions. 
Most clients of the API will supply empty array here.
</param>

<returns>
returns true on success, false if this entity's nodeId has
already been assigned or if an invalid nodeId is supplied.
</returns>

<remarks>
It is neither necessary nor desirable to assign a Node to
every entity. And it is not necessary to use this API to
assign a Node to an entity, the method AddNodeToMap() is
an alternate method of accomplishing this. To optimize DWF
compression, Node Ids should be sequential whenever possible.
Only add Nodes to entities for which you are publishing properties.
</remarks>

</member>
<member name="M:AcDMMEntityReactorInfo.SetNodeName(System.Int32,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1118">
<summary>
allows client to change node name but not node number
</summary>

<param name="nodeNumber">
the nodeNumber to operate on, should exist in the map 
and should be &gt; 0
</param>

<param name="name">
the Node name to assign to the specified Node
</param>

<returns>
true on success, false if the Node doesn't exist
</returns>
</member>
<member name="M:AcDMMEntityReactorInfo.AddProperties(AcDMMEPlotProperties!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1136">
<summary>
Allows a client to add free-floating AcDMMEPlotProperties objects.
Each of these has a unique Id and may reference other 
AcDMMEPlotProperties objects by Id.
</summary>

<param name="props">
a const pointer to an AcDMMEPlotProperties object.
</param>

<returns>
returns false on failure, e.g. if the properties are invalid
</returns>

<remarks>
The DMM caches a vector of these objects until the end
of the page. Multiple applications may contribute Properties from this
or other entities The client assigns a unique Id to each Properties 
object. A Properties object can includes other Properties objects by
reference (using its Id) to avoid redundancy.
The Properties objects will end up free floating in the page object 
definition. Each has a unique string ID assigned by the client.
Clients can associate Properties with a Node by using the related API
AddPropertiesIds().
The DMM will create one EPlotObject per Node and will have it
refer to all the Properties (by Id) associated with that Node.
Then the DMM creates one EPlotInstance with the node number and 
the Object just created. 
</remarks>

</member>
<member name="M:AcDMMEntityReactorInfo.AddPropertiesIds(AcArray&lt;AcDMMWideString&gt;*,AcDMMNode*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1168">
<summary>
Assign a vector of AcDMMEplotProperties Ids to a Node.
</summary>

<param name="IdVec">
a vector of Unicode Id strings for AcDMMEplotProperties objects,
all of which are to be associated with the specified NodeId.
</param>

<param name="node">
the Node with which the IdVec should be associated. This node should
be in the entity-nodeId map.
</param>

<returns>
true on success
</returns>

<remarks>
Here the client tells us which properties objects to
associate with this Node. This is done by giving us
a vector of unique properties Id strings. The DMM
accumulates all the properties Ids from every entity and
client that has a contribution for this node and eventually
when it makes an Object for this node in the page object definition
all of these properties Ids will be children in that Object's
EPlotProperties element
</remarks>

</member>
<member name="M:AcDMMEntityReactorInfo.flush" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1200">
<summary>
Forces the graphic pipeline to be flushed, to ensure synchronization;
when control returns, all geometry will have been pushed
down to the driver. 
</summary>

</member>
<member name="M:AcDMMEntityReactorInfo.cancelTheJob" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1208">
<summary>
If for any reason, you need to cancel the entire plot operation...
</summary>

</member>
<member name="M:AcDMMEntityReactorInfo.AddNodeToMap(AcDbObjectId,AcArray&lt;AcDbObjectId&gt;,System.Int32)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1214">
<summary>
assign a NodeId to any EntityId
</summary>

<param name="Id">
the AcDbObjectId of the entity whose node Id is to be assigned
</param>

<param name="objIds">
an additional AcDbObjectIdArray of objIds that should be empty if this
entity is not part of a block, and should be array of objects ids of 
each block that enclose this instance of the entity if it is part of
a block. This is necessary to disambiguate multiple block insertions. 
Most clients of the API will supply empty array here.
</param>

<param name="nodeId">
the integer NodeId to be assigned to the specified entity,
should be &gt; 0.
</param>

<returns>
returns false if the entity is already in the map or if it
isn't possible to get the oldId of the entity. To optimize DWF
compression, assign sequential Node Ids whenever possible.
Also returns false if the nodeId is invalid i.e. less than 1.
</returns>

<remarks>
if a "child" object is plotted before the "parent",
this allows the child to determine the parent's Node ID
</remarks>

</member>
<member name="M:AcDMMEntityReactorInfo.add3DDwfProperty(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1249">
<summary>
Call this method to add 3D DWF properties to entities when OnBeginEntity
notification is received. You can call this n times to add n number of 
properties.
</summary>

<param name="category">
name of the category to which you want to add the property
</param>

<param name="name">
property name
</param>

<param name="value">
property value
</param>

<returns>
returns true if property is added successfully
</returns>

</member>
<member name="M:AcDMMEntityReactorInfo.add3DDwfAttribute(System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*,System.Char!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1273">
<summary>
Call this method to add 3D DWF properties to entities when OnBeginEntity
notification is received. You can call this n times to add n number of 
properties.
</summary>

<param name="category">
name of the category to which you want to add the property
</param>

<param name="name">
property name
</param>

<param name="ns">
attribute namespace
</param>

<param name="nsUrl">
attribute namespace url
</param>

<param name="attName">
attribute name
</param>

<param name="attVal">
attribute value
</param>

<returns>
returns true if attribute is added successfully
</returns>

</member>
<member name="M:AcDMMEntityReactorInfo.getGraphicIDs" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1311">
<summary>
Call this method to get an array of graphic Node ID's associated 
with this entity
</summary>

<returns>
returns the graphic Node ID's associated with entity
</returns>
</member>
<member name="M:AcDMMEntityReactorInfo.getEntityBlockRefPath" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1321">
<summary>
Call this  method to get the the block ref path for the current entity
</summary>

<returns>
returns the block ref path for the current entity
</returns>
</member>
<member name="M:AcDMMEntityReactorInfo.Dispose" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1331">
<summary>
destructor
</summary>
</member>
<member name="T:AcDMMReactor" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1341">
class AcDMMReactor
<summary>
Clients must derive from and instantiate this class.
These reactors are called only during Publish to DWF operations.
Clients are responsible for obtaining configuration data for their
metadata publication from the AcPublishReactor
</summary>
</member>
<member name="M:AcDMMReactor.OnBeginSheet(AcDMMSheetReactorInfo*)" decl="true" source="c:\objectarx\inc\acdmmapi.h" line="1352">
<summary>
this reactor is called before any entities are plotted
for this sheet, to let clients know about the sheet which
is about to be plotted.
</summary>

<param name="pInfo">
a pointer to an AcDMMSheetReactorInfo object is supplied
to the reactor, providing both information and feedback
functions to clients.
</param>

</member>
<member name="M:AcDMMReactor.OnBeginEntity(AcDMMEntityReactorInfo*)" decl="true" source="c:\objectarx\inc\acdmmapi.h" line="1366">
<summary>
this reactor is called before each entity is plotted. This
allows a client to determine if this entity is one for which
it will publiush metadata, and provides the APIs needed to
associate a Node with this entity and to associate Properties
with the Node. Clients should be parsimonious in assigning
Nodes to entities.
</summary>

<param name="pInfo">
a pointer to an AcDMMEntityReactorInfo object is supplied
to the reactor, providing both information and feedback
functions to clients.
</param>

</member>
<member name="M:AcDMMReactor.OnEndEntity(AcDMMEntityReactorInfo*)" decl="true" source="c:\objectarx\inc\acdmmapi.h" line="1383">
<summary>
this reactor is called after each entity is plotted. 
</summary>

<param name="pInfo">
a pointer to an AcDMMEntityReactorInfo object is supplied
to the reactor, providing both information and feedback
functions to clients.
</param>

</member>
<member name="M:AcDMMReactor.OnEndSheet(AcDMMSheetReactorInfo*)" decl="true" source="c:\objectarx\inc\acdmmapi.h" line="1395">
<summary>
this reactor is called after all entities on the sheet have been
plotted, to let clients that plotting of the sheet is complete.
At this time clients may add resources and/or properties to the
sheet which are not associated with an specific entity.
</summary>

<param name="pInfo">
a pointer to an AcDMMSheetReactorInfo object is supplied
to the reactor, providing both information and feedback
functions to clients.
</param>

</member>
<member name="M:AcDMMReactor.Dispose" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1410">
<summary>
destructor
</summary>

</member>
<member name="M:AcDMMReactor.#ctor" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1417">
<summary>
constructor
protected, you must derive to instantiate one of these
</summary>
</member>
<member name="M:AcDMMReactor.OnBeginSheet(AcDMMSheetReactorInfo*)" decl="false" source="c:\objectarx\inc\acdmmapi.h" line="1424">
base class inlines for OnBegin and OnEnd methods
this is the default behavior for methods you choose
not to implement in your overridden reactor class
</member>
<member name="M:AcGlobAddDMMReactor(AcDMMReactor*)" decl="true" source="c:\objectarx\inc\acdmmapi.h" line="1434">
<summary>
the global function clients should call to add a reactor
</summary>

<param name="pReactor">
a pointer to the reactor the client has derived and instantiated
</param>

<remarks>
The AcDMMReactorManager, which is required to support these reactors,
only exists when AcPublish is running. The recommended practice is
to call this function in an AcPublishReactor OnAboutToBeginPublishing
and remove your DMM reactors in both OnEndPublish and in
OnCancelledOrFailedPublishing. Note that AcEPlotX must also be loaded
since that is where the AcDMMReactorManager is implemented.
</remarks>

</member>
<member name="M:AcGlobRemoveDMMReactor(AcDMMReactor*)" decl="true" source="c:\objectarx\inc\acdmmapi.h" line="1453">
<summary>
the global function clients should call to remove a reactor
</summary>

<param name="pReactor">
a pointer to the reactor the client has derived, instantiated and
previously added.
</param>
</member>
<member name="D:ads_hdlg" decl="false" source="c:\objectarx\inc\acdmmutils.h" line="15">
<summary>
This file describes the following objects
AcDMMWideString - a simple Unicode string class
AcDMMStringVec - a vector of AcDMMWideStrings
AcDMMNode - which encapsulates a w2d Node
AcDMMResourceInfo - which contains the description of one resource
AcDMMResourceVec - a vector of AcDMMResourceInfo objects
(file) to the added to the DWF page or to the ePlot global section
</summary>
</member>
</members>
</doc>