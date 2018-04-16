// (C) Copyright 2005-2007 by Autodesk, Inc. 
//
// Permission to use, copy, modify, and distribute this software in
// object code form for any purpose and without fee is hereby granted, 
// provided that the above copyright notice appears in all copies and 
// that both that copyright notice and the limited warranty and
// restricted rights notice below appear in all supporting 
// documentation.
//
// AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS. 
// AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
// MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC. 
// DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
// UNINTERRUPTED OR ERROR FREE.
//
// Use, duplication, or disclosure by the U.S. Government is subject to 
// restrictions set forth in FAR 52.227-19 (Commercial Computer
// Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
// (Rights in Technical Data and Computer Software), as applicable.

//-----------------------------------------------------------------------------
//- MText.h
#pragma once
//#include "Entity.h"

//-----------------------------------------------------------------------------
using namespace System ;
using namespace Autodesk::AutoCAD::Geometry ;
using namespace Autodesk::AutoCAD::DatabaseServices ;

//-----------------------------------------------------------------------------
//- Wizard Generated Custom Object .NET Wrapper
//- See the mgPoly in the ObjectARX SDK for further information
//-----------------------------------------------------------------------------
namespace ztAcadMgd {
	namespace DatabaseServices {

		/// <summary>  
		/// ¶àÐÐÎÄ×Ö
		/// </summary> 
		[Autodesk::AutoCAD::Runtime::Wrapper("AcDbMText")]
		public ref class MText : public Autodesk::AutoCAD::DatabaseServices::Entity {

		public:
			//- Constructor
			MText () ;

		internal:
			MText (System::IntPtr unmanagedPointer, bool bAutoDelete) ;

			//- Returns the unmanaged ARX Object
			inline AcDbMText *GetImpObj () {
				return (static_cast<AcDbMText *>(UnmanagedObject.ToPointer ())) ;
			}

		public:
			//- To define properties which get/set values of your object
			//- the format you must use is
			//-		__property void set_Center(Point2d point);
			//-		__property Point2d get_Center();
			property double ActualHeight
			{
				double get();
			}
			property double ActualWidth
			{
				double get();
			}
			property static String^ AlignChange
			{
				String^ get();
			}
			property double Ascent
			{
				double get();
			}
			property static String^ BlockEnd
			{
				String^ get();
			}
			property static String^ ColorChange
			{
				String^ get();
			}
			property String^ Contents
			{
				String^ get();
				void set(String^ value);
			}
			property Point3d Location
			{
				Point3d get();
				void set(Point3d value);
			}
			property Vector3d Normal
			{
				Vector3d get();
				void set(Vector3d value);
			}
			property double Rotation
			{
				double get();
				void set(double value);
			}
			property double TextHeight
			{
				double get();
				void set(double value);
			}
			property Autodesk::AutoCAD::DatabaseServices::ObjectId^ TextStyle
			{
				 Autodesk::AutoCAD::DatabaseServices::ObjectId^ get();
				void set(Autodesk::AutoCAD::DatabaseServices::ObjectId^ value);
			}
			property double Width
			{
				double get();
				void set(double value);
			}
		} ;

	}
}